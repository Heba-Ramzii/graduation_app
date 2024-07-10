import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/data/models/patient_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
class MessageModel
{
  final String message;
  final bool senderIsDoctor;
  final Timestamp date;

  MessageModel({required this.message, required this.senderIsDoctor, required this.date});

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'],
      senderIsDoctor: map['senderIsDoctor'],
      date: map['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'senderIsDoctor': senderIsDoctor,
      'date': date,
    };
  }

}

class MyChatScreen extends StatefulWidget {
  const MyChatScreen({super.key, required this.patientModel, required this.chatId});
  final PatientModel patientModel;
  final String chatId;

  @override
  State<MyChatScreen> createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {


  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var controller = TextEditingController();

    print('object');
    print(widget.chatId);

    return Scaffold(
      backgroundColor: ColorsManager.homePageBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorsManager.primary,
            size: screenWidth * 0.06,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: ColorsManager.white,
        title: Row(
          children: [
            ProfileImage(
              height: screenWidth * 0.12, width: screenWidth * 0.12,size: screenWidth * 0.12,
              url: widget.patientModel.imagePath,
            ),
            SizedBox(width: screenWidth * 0.03),
            Text(
              widget.patientModel.name??'',
              style: TextStyle(
                color: ColorsManager.black,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.more_vert,
        //       color: ColorsManager.primary,
        //       size: screenWidth * 0.06,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body:
      Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('chat')
                .doc(widget.chatId)
                .collection('messages')
                .orderBy('time', descending: false)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              print(snapshot.data!.docs.length);
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index)
                    {
                      MessageModel messageModel = MessageModel.fromMap(
                          snapshot.data!.docs[index].data() as Map<String, dynamic>);
                      if(messageModel.senderIsDoctor){
                        return MyMessageWidget(message: messageModel);
                      }
                      else
                      {
                        return OtherMessageWidget(message: messageModel);
                      }
                    }
                ),
              );



              // return Chat(
              //   messages: _messages,
              //   onAttachmentPressed: _handleAttachmentPressed,
              //   onPreviewDataFetched: _handlePreviewDataFetched,
              //   onSendPressed: _handleSendPressed,
              //   disableImageGallery: false,
              //   theme: DefaultChatTheme(
              //     sentMessageBodyTextStyle: TextStyle(
              //       color: ColorsManager.white,
              //       decorationColor: ColorsManager.primary,
              //       fontSize: screenWidth * 0.04,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     backgroundColor: ColorsManager.background,
              //     inputBackgroundColor: ColorsManager.white,
              //     inputTextColor: ColorsManager.primary,
              //     primaryColor: ColorsManager.primary,
              //     secondaryColor: ColorsManager.primaryLight3,
              //   ),
              //   user: user,
              // );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth * 0.04,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey,

                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: ColorsManager.primary,
                    size: screenWidth * 0.08,
                  ),
                  onPressed:
                      () {
                    if(controller.text.isNotEmpty)
                    {
                      WriteBatch batch = FirebaseFirestore.instance.batch();
                      batch.set(FirebaseFirestore.instance.collection('chat')
                          .doc(widget.chatId)
                          .collection('messages').doc(), {
                        'message': controller.text,
                        'senderIsDoctor': true,
                        'time': Timestamp.now(),
                      });
                      batch.update(FirebaseFirestore.instance.collection('chat')
                          .doc(widget.chatId), {
                        'lastMessage': controller.text,
                        'lastMessageTime': Timestamp.now(),
                        'lastMessageIsDoctor': true,
                      });
                      batch.commit();

                      controller.clear();
                    }
                  },
                ),
              ),
              controller: controller,
            ),
          )
        ],
      ),
    );
  }

  // void _handleSendPressed(types.PartialText message) {
  //   final textMessage = types.TextMessage(
  //     author: user,
  //     createdAt: DateTime.now().millisecondsSinceEpoch,
  //     id: "id",
  //     text: message.text,
  //   );
  //
  //   _addMessage(textMessage);
  // }
  //
  // void _addMessage(types.Message message) {
  //   setState(() {
  //     _messages.insert(0, message);
  //   });
  // }
  //
  // void _handleAttachmentPressed() {
  //   showModalBottomSheet<void>(
  //     context: context,
  //     builder: (BuildContext context) => SafeArea(
  //       child: SizedBox(
  //         height: MediaQuery.of(context).size.height * 0.2,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: <Widget>[
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 _handleImageSelection();
  //               },
  //               child: const Align(
  //                 alignment: AlignmentDirectional.centerStart,
  //                 child: Text('Photo'),
  //               ),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 _handleFileSelection();
  //               },
  //               child: const Align(
  //                 alignment: AlignmentDirectional.centerStart,
  //                 child: Text('File'),
  //               ),
  //             ),
  //             TextButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Align(
  //                 alignment: AlignmentDirectional.centerStart,
  //                 child: Text('Cancel'),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // void _handlePreviewDataFetched(
  //   types.TextMessage message,
  //   types.PreviewData previewData,
  // ) {
  //   final index = _messages.indexWhere((element) => element.id == message.id);
  //   final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
  //     previewData: previewData,
  //   );
  //
  //   setState(() {
  //     _messages[index] = updatedMessage;
  //   });
  // }
  //
  // void _handleImageSelection() async {
  //   final result = await ImagePicker().pickImage(
  //     imageQuality: 70,
  //     maxWidth: 1440,
  //     source: ImageSource.gallery,
  //   );
  //
  //   if (result != null) {
  //     final bytes = await result.readAsBytes();
  //     final image = await decodeImageFromList(bytes);
  //
  //     final message = types.ImageMessage(
  //       author: user,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       height: image.height.toDouble(),
  //       id: "id",
  //       name: result.name,
  //       size: bytes.length,
  //       uri: result.path,
  //       width: image.width.toDouble(),
  //     );
  //
  //     _addMessage(message);
  //   }
  // }
  //
  // void _handleFileSelection() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.any,
  //   );
  //
  //   if (result != null && result.files.single.path != null) {
  //     final message = types.FileMessage(
  //       author: user,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       id: "0",
  //       mimeType: lookupMimeType(result.files.single.path!),
  //       name: result.files.single.name,
  //       size: result.files.single.size,
  //       uri: result.files.single.path!,
  //     );
  //
  //     _addMessage(message);
  //   }
  // }
}

class MyChatPatientScreen extends StatefulWidget {
  const MyChatPatientScreen({super.key, required this.doctorModel, required this.chatId});
  final DoctorModel doctorModel;
  final String chatId;

  @override
  State<MyChatPatientScreen> createState() => _MyChatPatientScreenState();
}

class _MyChatPatientScreenState extends State<MyChatPatientScreen> {


  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var controller = TextEditingController();

    print('object');
    print(widget.chatId);

    return Scaffold(
      backgroundColor: ColorsManager.homePageBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorsManager.primary,
            size: screenWidth * 0.06,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: ColorsManager.white,
        title: Row(
          children: [
            ProfileImage(
              height: screenWidth * 0.12, width: screenWidth * 0.12,size: screenWidth * 0.12,
              url: widget.doctorModel.imagePath,
            ),
            SizedBox(width: screenWidth * 0.03),
            Text(
              widget.doctorModel.name??'',
              style: TextStyle(
                color: ColorsManager.black,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.more_vert,
        //       color: ColorsManager.primary,
        //       size: screenWidth * 0.06,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body:
      Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('chat')
                .doc(widget.chatId)
                .collection('messages')
                .orderBy('time', descending: false)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              print(snapshot.data!.docs.length);
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index)
                    {
                      MessageModel messageModel = MessageModel.fromMap(
                          snapshot.data!.docs[index].data() as Map<String, dynamic>);
                      if(messageModel.senderIsDoctor){
                        return OtherMessageWidget(message: messageModel);
                      }
                      else
                      {
                        return MyMessageWidget(message: messageModel);
                      }
                    }
                ),
              );



              // return Chat(
              //   messages: _messages,
              //   onAttachmentPressed: _handleAttachmentPressed,
              //   onPreviewDataFetched: _handlePreviewDataFetched,
              //   onSendPressed: _handleSendPressed,
              //   disableImageGallery: false,
              //   theme: DefaultChatTheme(
              //     sentMessageBodyTextStyle: TextStyle(
              //       color: ColorsManager.white,
              //       decorationColor: ColorsManager.primary,
              //       fontSize: screenWidth * 0.04,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     backgroundColor: ColorsManager.background,
              //     inputBackgroundColor: ColorsManager.white,
              //     inputTextColor: ColorsManager.primary,
              //     primaryColor: ColorsManager.primary,
              //     secondaryColor: ColorsManager.primaryLight3,
              //   ),
              //   user: user,
              // );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth * 0.04,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey,

                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: ColorsManager.primary,
                    size: screenWidth * 0.08,
                  ),
                  onPressed:
                      () {
                    if(controller.text.isNotEmpty)
                    {
                      WriteBatch batch = FirebaseFirestore.instance.batch();
                      batch.set(FirebaseFirestore.instance.collection('chat')
                          .doc(widget.chatId)
                          .collection('messages').doc(), {
                        'message': controller.text,
                        'senderIsDoctor': false,
                        'time': Timestamp.now(),
                      });
                      batch.update(FirebaseFirestore.instance.collection('chat')
                          .doc(widget.chatId), {
                        'lastMessage': controller.text,
                        'lastMessageTime': Timestamp.now(),
                        'lastMessageIsDoctor': false,
                      });
                      batch.commit();

                      controller.clear();
                    }
                  },
                ),
              ),
              controller: controller,
            ),
          )
        ],
      ),
    );
  }

// void _handleSendPressed(types.PartialText message) {
//   final textMessage = types.TextMessage(
//     author: user,
//     createdAt: DateTime.now().millisecondsSinceEpoch,
//     id: "id",
//     text: message.text,
//   );
//
//   _addMessage(textMessage);
// }
//
// void _addMessage(types.Message message) {
//   setState(() {
//     _messages.insert(0, message);
//   });
// }
//
// void _handleAttachmentPressed() {
//   showModalBottomSheet<void>(
//     context: context,
//     builder: (BuildContext context) => SafeArea(
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height * 0.2,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 _handleImageSelection();
//               },
//               child: const Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text('Photo'),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 _handleFileSelection();
//               },
//               child: const Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text('File'),
//               ),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Align(
//                 alignment: AlignmentDirectional.centerStart,
//                 child: Text('Cancel'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// void _handlePreviewDataFetched(
//   types.TextMessage message,
//   types.PreviewData previewData,
// ) {
//   final index = _messages.indexWhere((element) => element.id == message.id);
//   final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
//     previewData: previewData,
//   );
//
//   setState(() {
//     _messages[index] = updatedMessage;
//   });
// }
//
// void _handleImageSelection() async {
//   final result = await ImagePicker().pickImage(
//     imageQuality: 70,
//     maxWidth: 1440,
//     source: ImageSource.gallery,
//   );
//
//   if (result != null) {
//     final bytes = await result.readAsBytes();
//     final image = await decodeImageFromList(bytes);
//
//     final message = types.ImageMessage(
//       author: user,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       height: image.height.toDouble(),
//       id: "id",
//       name: result.name,
//       size: bytes.length,
//       uri: result.path,
//       width: image.width.toDouble(),
//     );
//
//     _addMessage(message);
//   }
// }
//
// void _handleFileSelection() async {
//   final result = await FilePicker.platform.pickFiles(
//     type: FileType.any,
//   );
//
//   if (result != null && result.files.single.path != null) {
//     final message = types.FileMessage(
//       author: user,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: "0",
//       mimeType: lookupMimeType(result.files.single.path!),
//       name: result.files.single.name,
//       size: result.files.single.size,
//       uri: result.files.single.path!,
//     );
//
//     _addMessage(message);
//   }
// }
}


class MyMessageWidget extends StatelessWidget {
  final MessageModel message;

  const MyMessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: ColorsManager.primary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              message.message,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              '${message.date.toDate().year}-${message.date.toDate().month}-${message.date.toDate().day} ${message.date.toDate().hour}:${message.date.toDate().minute}'
              ,
              style:  TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtherMessageWidget extends StatelessWidget {
  final MessageModel message;

  const OtherMessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.message, style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 16
            ),),
            const SizedBox(height: 5),
            Text(
              '${message.date.toDate().year}-${message.date.toDate().month}-${message.date.toDate().day} ${message.date.toDate().hour}:${message.date.toDate().minute}'
              ,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}