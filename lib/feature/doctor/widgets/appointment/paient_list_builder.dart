import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import '../../../../core/core_widgets/profile_image.dart';
import '../../../../core/theme_manager/colors_manager.dart';
import '../../../../core/theme_manager/style_manager.dart';

class PatientListBuilder extends StatelessWidget {
  const PatientListBuilder(
      {super.key, required this.patientBookModel, required this.index});
  final PatientBookModel patientBookModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 400,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: StyleManager.containerDecoration,
      child: Row(
        children: [
          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(patientBookModel.patientId)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return ProfileImage(
                  height: 46,
                  width: 42,
                  url: data['imagePath'],
                );
              }

              return Text("loading");
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        patientBookModel.patientName ?? '',
                        style: StyleManager.textStyle14mid,
                      ),
                      //const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Text(
                          '${index + 1}',
                          style: StyleManager.textStyle12.copyWith(
                              fontSize: 13, color: ColorsManager.primaryLight),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    patientBookModel.description ?? '',
                    style: StyleManager.textStyle12.copyWith(
                        fontSize: 13, color: ColorsManager.primaryLight),
                  ),
                  /*      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.clock,
                            size: 15,
                            color: ColorsManager.primary,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "8:45 AM",
                            style: StyleManager.textStyle12
                                .copyWith(color: ColorsManager.primaryLight),
                          ),
                        ],
                      ),
                      //const Spacer(),
                      const Icon(
                        IconlyBold.download,
                        color: ColorsManager.primary,
                      ),
                    ],
                  ),
                 */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
