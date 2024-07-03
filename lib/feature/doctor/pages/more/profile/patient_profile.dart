import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doc_image_cubit/get_doc_image_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doc_image_cubit/get_doc_image_state.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_doctor_cubit/get_doctor_state.dart';
import 'package:graduation_app/feature/doctor/cubit/update_doctor_cubit/update_doctor_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/update_doctor_cubit/update_doctor_state.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/edit_info_row.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme_manager/colors_manager.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  @override
  void initState() {
    selectedDate = null;
    GetDocImageCubit.get(context).image = null;
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

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10),
          child: BlocConsumer<GetDoctorCubit, GetDoctorState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetDoctorLoading) {
                  return const DefaultLoading();
                } else if (state is GetDoctorSuccess) {
                  nameController.text = state.doctorModel.name ?? '';
                  emailController.text = state.doctorModel.email ?? '';

                  if (phoneController.text.isEmpty &&
                      state.doctorModel.phone != null) {
                    phoneController.text = state.doctorModel.phone!;
                  }
                  if (selectedDate == null &&
                      state.doctorModel.birthDate != null) {
                    selectedDate = state.doctorModel.birthDate!.toDate();
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
                                  BlocConsumer<GetDocImageCubit,
                                          GetDocImageState>(
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
                                                    image: GetDocImageCubit.get(
                                                                    context)
                                                                .image !=
                                                            null
                                                        ? DecorationImage(
                                                            image: FileImage(File(
                                                                GetDocImageCubit
                                                                        .get(
                                                                            context)
                                                                    .image!
                                                                    .path)),
                                                            fit: BoxFit.cover,
                                                          )
                                                        : state.doctorModel
                                                                    .imagePath !=
                                                                null
                                                            ? DecorationImage(
                                                                image: NetworkImage(state
                                                                    .doctorModel
                                                                    .imagePath!),
                                                                fit: BoxFit
                                                                    .cover,
                                                              )
                                                            : null),
                                                child: GetDocImageCubit.get(
                                                                    context)
                                                                .image ==
                                                            null &&
                                                        state.doctorModel
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
                                                    GetDocImageCubit.get(
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
                          BlocConsumer<UpdateDoctorCubit, UpdateDoctorState>(
                            listener: (context, state) {
                              if (state is UpdateDoctorSuccess) {
                                callMyToast(
                                    massage: 'Profile updated successfully',
                                    state: ToastState.SUCCESS);
                                GetDoctorCubit.get(context).getDoctor();
                              } else if (state is UpdateDoctorFailure) {
                                callMyToast(
                                    massage: state.failure.message,
                                    state: ToastState.ERROR);
                              }
                            },
                            builder: (context, updateState) {
                              if (updateState is UpdateDoctorLoading) {
                                return const DefaultLoading();
                              } else {
                                return CustomMaterialButton(
                                  text: "Update profile",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      state.doctorModel.image =
                                          GetDocImageCubit.get(context).image;

                                      state.doctorModel.name =
                                          nameController.text;
                                      state.doctorModel.phone =
                                          phoneController.text;
                                      state.doctorModel.birthDate =
                                          Timestamp.fromDate(selectedDate!);
                                      UpdateDoctorCubit.get(context)
                                          .updateDoctor(
                                              doctorModel: state.doctorModel);
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
