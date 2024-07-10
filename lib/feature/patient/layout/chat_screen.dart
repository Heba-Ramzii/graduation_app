import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/function/core_function.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_state.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_state.dart';
import 'package:graduation_app/feature/patient/data/models/patient_model.dart';
import 'package:graduation_app/feature/patient/layout/my_chat_screen.dart';

import '../widget/chat_box_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
      List<bool> haveMessage = [
        true,
        true,
        true,
        false,
        false,
        true,
        true,
        true,
        false,
        false,

      ];

    return Scaffold(
      /// backgroundColor: ColorsManager.homePageBackground,
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
         title: Text("My Chat",
          style: StyleManager.textStyle18.copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: ColorsManager.primary,
                size: 24,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: ColorsManager.primary,
                size: 24,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<GetDoctorCubit, GetDoctorState>(
                  builder: (BuildContext context, state) {
                if (state is GetDoctorLoading)
                {
                  return const DefaultLoading();
                }
                else if(state is GetDoctorSuccess)
                {
                 return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('chat')
                        .where('doctorId', isEqualTo: state.doctorModel.id).snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index)
                          {
                            Map<String, dynamic> upperData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                            return
                              FutureBuilder<DocumentSnapshot>(
                                future: FirebaseFirestore.instance
                                    .collection('users').doc(upperData['patientId']).get(),
                                builder:
                                    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                                  if (snapshot.hasError) {
                                    return Text("Something went wrong");
                                  }

                                  if (snapshot.hasData && !snapshot.data!.exists) {
                                    return Text("Document does not exist");
                                  }

                                  if (snapshot.connectionState == ConnectionState.done) {
                                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                    PatientModel patientModel = PatientModel.fromJson(data);
                                    return InkWell(
                                      onTap: (){
                                        navigateToScreen(context, MyChatScreen(
                                          patientModel: patientModel,
                                          chatId: upperData['id'],
                                        ));
                                      },
                                      child: ChatBox(
                                        patientModel: patientModel, upperData: upperData,
                                        haveMessage: haveMessage[index],),
                                    );

                                  }

                                  return Text("loading");
                                },
                              );
                          },
                          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5),
                          itemCount: snapshot.data!.docs.length
                      );
                    },
                  );
                }
                else if(state is GetDoctorFailure)
                {
                  return Text(state.failure.message);
                }
                return const SizedBox(child: Text('data'),);
              }, listener: (BuildContext context, state) {
                if (state is GetDoctorFailure)
                {
                  print('++++++++${state.failure.message}+++++++++');
                  callMyToast(massage: state.failure.message, state: ToastState.ERROR);
                }
              }),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    "your personal messages are ",
                  style: StyleManager.textStyle13.copyWith(
                    color: ColorsManager.font,
                  ),
                ),
                Text(
                    "end-to-end-encrypted",
                  style: StyleManager.textStyle13.copyWith(
                    color: ColorsManager.primary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}


class ChatPatientScreen extends StatefulWidget {
  const ChatPatientScreen({super.key});

  @override
  State<ChatPatientScreen> createState() => _ChatPatientScreenState();
}

class _ChatPatientScreenState extends State<ChatPatientScreen> {
  @override
  Widget build(BuildContext context) {
    List<bool> haveMessage = [
      true,
      true,
      true,
      false,
      false,
      true,
      true,
      true,
      false,
      false,

    ];

    return Scaffold(
      /// backgroundColor: ColorsManager.homePageBackground,
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
        title: Text("My Chat",
          style: StyleManager.textStyle18.copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: ColorsManager.primary,
                size: 24,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: ColorsManager.primary,
                size: 24,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<GetPatientCubit, GetPatientState>(
                  builder: (BuildContext context, state) {
                    if (state is GetPatientLoading)
                    {
                      return const DefaultLoading();
                    }
                    else if(state is GetPatientSuccess)
                    {
                      return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('chat')
                            .where('patientId', isEqualTo: state.patientModel.id).snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text("Loading");
                          }

                          return ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index)
                              {
                                Map<String, dynamic> upperData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                                return
                                  FutureBuilder<DocumentSnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection('users').doc(upperData['doctorId']).get(),
                                    builder:
                                        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                                      if (snapshot.hasError) {
                                        return Text("Something went wrong");
                                      }

                                      if (snapshot.hasData && !snapshot.data!.exists) {
                                        return Text("Document does not exist");
                                      }

                                      if (snapshot.connectionState == ConnectionState.done) {
                                        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                        DoctorModel doctorModel = DoctorModel.fromJson(data);
                                        return InkWell(
                                          onTap: (){
                                            navigateToScreen(context, MyChatPatientScreen(
                                              doctorModel: doctorModel,
                                              chatId: upperData['id'],
                                            ));
                                          },
                                          child: ChatPatientBox(
                                            doctorModel: doctorModel, upperData: upperData,
                                            haveMessage: haveMessage[index],),
                                        );

                                      }

                                      return Text("loading");
                                    },
                                  );
                              },
                              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5),
                              itemCount: snapshot.data!.docs.length
                          );
                        },
                      );
                    }
                    else if(state is GetPatientFailure)
                    {
                      return Text(state.failure.message);
                    }
                    return const SizedBox(child: Text('data'),);
                  }, listener: (BuildContext context, state) {
                if (state is GetPatientFailure)
                {
                  print('++++++++${state.failure.message}+++++++++');
                  callMyToast(massage: state.failure.message, state: ToastState.ERROR);
                }
              }),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "your personal messages are ",
                    style: StyleManager.textStyle13.copyWith(
                      color: ColorsManager.font,
                    ),
                  ),
                  Text(
                    "end-to-end-encrypted",
                    style: StyleManager.textStyle13.copyWith(
                      color: ColorsManager.primary,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],),
            )
          ],
        ),
      ),
    );
  }
}
