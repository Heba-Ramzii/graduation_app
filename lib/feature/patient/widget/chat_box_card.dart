import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/data/models/patient_model.dart';

import '../../../core/core_widgets/profile_image.dart';

class ChatBox extends StatelessWidget {
  final Map<String, dynamic> upperData;
  final bool haveMessage;
  final PatientModel patientModel;

  const ChatBox(
      {super.key,
        required this.patientModel,
      required this.upperData,
        required this.haveMessage,
        
      });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
Timestamp timestamp = upperData['lastMessageTime'];

    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: StyleManager.containerDecoration,
        child: ListTile(
          leading: ProfileImage(
            height: screenWidth * 0.12, width: screenWidth * 0.12,size: screenWidth * 0.12, url: patientModel.imagePath,
          ),
          title: Text(
              patientModel.name??'',
            style: StyleManager.mainTextStyle15.copyWith(
              fontWeight: FontWeight.w500
            )
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                '${upperData['lastMessageIsDoctor']? 'Me' : patientModel.name}: ${upperData['lastMessage']}',
                style: const TextStyle(color: ColorsManager.blue),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( '${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year} ${timestamp.toDate().hour}:${timestamp.toDate().minute}'
                ,
                style: StyleManager.textStyle13.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              // haveMessage ? CircleAvatar(
              //   radius: 15,
              //   backgroundColor: ColorsManager.primaryLight3,
              //   child: Text(
              //       "2",
              //     style: StyleManager.buttonTextStyle16.copyWith(
              //       fontWeight: FontWeight.normal,
              //     ),
              //   ),
              // )
              //     :
              // const Icon(
              //   Icons.done_all_rounded,
              //   color: ColorsManager.grayFont,
              //
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class ChatPatientBox extends StatelessWidget {
  final Map<String, dynamic> upperData;
  final bool haveMessage;
  final DoctorModel doctorModel;

  const ChatPatientBox(
      {super.key,
        required this.doctorModel,
        required this.upperData,
        required this.haveMessage,

      });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Timestamp timestamp = upperData['lastMessageTime'];

    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: StyleManager.containerDecoration,
        child: ListTile(
          leading: ProfileImage(
            height: screenWidth * 0.12, width: screenWidth * 0.12,size: screenWidth * 0.12, url: doctorModel.imagePath,
          ),
          title: Text(
              doctorModel.name??'',
              style: StyleManager.mainTextStyle15.copyWith(
                  fontWeight: FontWeight.w500
              )
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                '${!upperData['lastMessageIsDoctor']? 'Me' : 'message'}: ${upperData['lastMessage']}',
                style: const TextStyle(color: ColorsManager.blue),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( '${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year} ${timestamp.toDate().hour}:${timestamp.toDate().minute}'
                ,
                style: StyleManager.textStyle13.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              // haveMessage ? CircleAvatar(
              //   radius: 15,
              //   backgroundColor: ColorsManager.primaryLight3,
              //   child: Text(
              //       "2",
              //     style: StyleManager.buttonTextStyle16.copyWith(
              //       fontWeight: FontWeight.normal,
              //     ),
              //   ),
              // )
              //     :
              // const Icon(
              //   Icons.done_all_rounded,
              //   color: ColorsManager.grayFont,
              //
              // )
            ],
          ),
        ),
      ),
    );
  }
}
