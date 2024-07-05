import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_cubit/get_patient_state.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_image_cubit/get_patient_image_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/get_patient_image_cubit/get_patient_image_state.dart';
import 'package:graduation_app/feature/patient/cubit/update_patient_cubit/update_patient_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/update_patient_cubit/update_patient_state.dart';
import 'package:graduation_app/feature/patient/widget/edit_info.dart';
import 'package:intl/intl.dart';
class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  @override
  void initState() {
    selectedDate = null;
    GetPatientImageCubit.get(context).image = null;
    super.initState();
  }

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final sexController = TextEditingController();
  final phoneController = TextEditingController();
  final sepcialityController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10),
          child: BlocConsumer<GetPatientCubit, GetPatientState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetPatientLoading) {
                  return const DefaultLoading();
                } else if (state is GetPatientSuccess) {
                  nameController.text = state.patientModel.name ?? '';
                  emailController.text = state.patientModel.email ?? '';

                  if (phoneController.text.isEmpty &&
                      state.patientModel.phone != null) {
                    phoneController.text = state.patientModel.phone!;
                  }
                  if (selectedDate == null &&
                      state.patientModel.birthDate != null) {
                    selectedDate = state.patientModel.birthDate!.toDate();
                  }

                  return Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30.0),
                            child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  BlocConsumer<GetPatientImageCubit,
                                      GetPatientImageState>(
                                      listener: (context, state) {},
                                      builder: (context, imageState) {
                                        return Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            CircleAvatar(
                                              radius: 52,
                                              backgroundColor: Colors.white,
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        50),
                                                    image: GetPatientImageCubit.get(
                                                        context)
                                                        .image !=
                                                        null
                                                        ? DecorationImage(
                                                      image: FileImage(File(
                                                          GetPatientImageCubit
                                                              .get(
                                                              context)
                                                              .image!
                                                              .path)),
                                                      fit: BoxFit.cover,
                                                    )
                                                        : state.patientModel
                                                        .imagePath !=
                                                        null
                                                        ? DecorationImage(
                                                      image: NetworkImage(state
                                                          .patientModel
                                                          .imagePath!),
                                                      fit: BoxFit
                                                          .cover,
                                                    )
                                                        : null),
                                                child: GetPatientImageCubit.get(
                                                    context)
                                                    .image ==
                                                    null &&
                                                    state.patientModel
                                                        .imagePath ==
                                                        null
                                                    ? const Icon(
                                                  Icons.person,
                                                  size: 40,
                                                  color: Colors.grey,
                                                )
                                                    : null,
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundColor:
                                              ColorsManager.primary,
                                              radius: 18,
                                              child: Center(
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.camera_alt_outlined,
                                                    color: Colors.white,
                                                    size: 18,
                                                  ),
                                                  onPressed: () {
                                                    GetPatientImageCubit.get(
                                                        context)
                                                        .getImage();
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                  /* ProfileImage(
                                    size: 90,
                                    height: 100,
                                    width: 100,
                                    url: state.doctorModel.imagePath,
                                  ),
                                  const InkWell(
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: ColorsManager.white,
                                      child: Icon(
                                        IconlyLight.edit,
                                        size: 18,
                                        color: ColorsManager.primary,
                                      ),
                                    ),
                                  ),*/
                                ]),
                          ),
                          EditInfoRow(
                            title: "Name",
                            controller: nameController,
                            inputType: TextInputType.name,
                          ),
                          EditInfoRow(
                            title: "Email",
                            readOnly: true,
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                          ),
                          EditInfoRow(
                            title: "Phone Number",
                            controller: phoneController,
                            inputType: TextInputType.phone,
                          ),
                          EditInfoRow(
                            title: "Date of Birth",
                            readOnly: true,
                            controller: TextEditingController(
                                text: selectedDate == null
                                    ? ''
                                    : DateFormat('dd-MM-yyyy')
                                    .format(selectedDate!)),
                            inputType: TextInputType.datetime,
                            icon: IconlyLight.calendar,
                            onTap: () {
                              _selectDate(context);
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          BlocConsumer<UpdatePatientCubit, UpdatePatientState>(
                            listener: (context, state) {
                              if (state is UpdatePatientSuccess) {
                                callMyToast(
                                    massage: 'Profile updated successfully',
                                    state: ToastState.SUCCESS);
                                GetPatientCubit.get(context).getPatient();
                              } else if (state is UpdatePatientFailure) {
                                callMyToast(
                                    massage: state.failure.message,
                                    state: ToastState.ERROR);
                              }
                            },
                            builder: (context, updateState) {
                              if (updateState is UpdatePatientLoading) {
                                return const DefaultLoading();
                              } else {
                                return CustomMaterialButton(
                                  text: "Update profile",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      state.patientModel.image =
                                          GetPatientImageCubit.get(context).image;
                                      state.patientModel.name =
                                          nameController.text;
                                      state.patientModel.phone =
                                          phoneController.text;
                                      state.patientModel.birthDate =
                                          Timestamp.fromDate(selectedDate!);
                                      UpdatePatientCubit.get(context)
                                          .updatePatient(
                                          patientModel: state.patientModel);
                                    }
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              })),
    );
  }
}
