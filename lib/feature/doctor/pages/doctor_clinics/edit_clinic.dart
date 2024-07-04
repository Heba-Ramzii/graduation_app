import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'dart:io';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/edit_clinic_cubit/edit_clinic_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/edit_clinic_cubit/edit_clinic_state.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_appointment_cubit/get_clinic_appointment_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_appointment_cubit/get_clinic_appointment_state.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_image_cubit/get_clinic_image_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_image_cubit/get_clinic_image_state.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/widgets/profile/edit_info_row.dart';

class EditClinic extends StatefulWidget {
  final ClinicModel clinicModel;

  const EditClinic({super.key, required this.clinicModel});

  @override
  State<EditClinic> createState() => _EditClinicState();
}

class _EditClinicState extends State<EditClinic> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final addressController = TextEditingController();

  final descriptionController = TextEditingController();

  final priceController = TextEditingController();

  final List<Map<String, dynamic>> daysOfWeek = [
    {'name': 'Saturday', 'value': 6},
    {'name': 'Sunday', 'value': 7},
    {'name': 'Monday', 'value': 1},
    {'name': 'Tuesday', 'value': 2},
    {'name': 'Wednesday', 'value': 3},
    {'name': 'Thursday', 'value': 4},
    {'name': 'Friday', 'value': 5},
  ];

  final formKey = GlobalKey<FormState>();
  List<AppointmentModel> appointments = [];
  @override
  void dispose() {
    GetClinicImageCubit.get(context).profileImage = null;
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    nameController.text = widget.clinicModel.name ?? '';
    phoneController.text = widget.clinicModel.phone ?? '';
    addressController.text = widget.clinicModel.address ?? '';
    descriptionController.text = widget.clinicModel.description ?? '';
    priceController.text = widget.clinicModel.price.toString();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          BlocConsumer<GetClinicImageCubit, GetClinicImageState>(
            listener: (context, state) {
              if (state is GetClinicImageFailure) {
                callMyToast(
                    massage: state.failure.message, state: ToastState.ERROR);
              }
            },
            builder: (context, state) {
              return BlocBuilder<EditClinicCubit, EditClinicState>(
                  builder: (context, state) {
                if (state is EditClinicLoading) {
                  return const SizedBox();
                } else {
                  return IconButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        widget.clinicModel.name = nameController.text;
                        widget.clinicModel.phone = phoneController.text;
                        widget.clinicModel.address = addressController.text;
                        widget.clinicModel.description =
                            descriptionController.text;
                        widget.clinicModel.price =
                            int.parse(priceController.text);
                        widget.clinicModel.image =
                            GetClinicImageCubit.get(context).profileImage;

                        widget.clinicModel.appointments = appointments;
                        widget.clinicModel.image =
                            GetClinicImageCubit.get(context).profileImage;

                        EditClinicCubit.get(context).editClinic(
                          widget.clinicModel,
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.done_rounded,
                      color: ColorsManager.primary,
                    ),
                  );
                }
              });
            },
          ),
        ],
        title: "Edit Clinic",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<EditClinicCubit, EditClinicState>(
                  listener: (context, state) {
                    if (state is EditClinicSuccess) {
                      callMyToast(
                          massage: 'Successfully Edited',
                          state: ToastState.SUCCESS);
                    } else if (state is EditClinicFailure) {
                      callMyToast(
                          massage: state.failure.message,
                          state: ToastState.ERROR);
                    }
                  },
                  builder: (context, state) {
                    if (state is EditClinicLoading) {
                      return const Center(
                        child: LinearProgressIndicator(),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: StyleManager.borderRadius,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        BlocConsumer<GetClinicImageCubit, GetClinicImageState>(
                            listener: (context, state) {},
                            builder: (context, state) {
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
                                              BorderRadius.circular(50),
                                          image: GetClinicImageCubit.get(
                                                          context)
                                                      .profileImage !=
                                                  null
                                              ? DecorationImage(
                                                  image: FileImage(File(
                                                      GetClinicImageCubit.get(
                                                              context)
                                                          .profileImage!
                                                          .path)),
                                                  fit: BoxFit.cover,
                                                )
                                              : widget.clinicModel.imagePath !=
                                                      null
                                                  ? DecorationImage(
                                                      image: NetworkImage(widget
                                                          .clinicModel
                                                          .imagePath!),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : null),
                                      child: GetClinicImageCubit.get(context)
                                                      .profileImage ==
                                                  null &&
                                              widget.clinicModel.imagePath ==
                                                  null
                                          ? const Icon(
                                              Icons.add_business_outlined,
                                              size: 40,
                                              color: Colors.grey,
                                            )
                                          : null,
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: ColorsManager.primary,
                                    radius: 18,
                                    child: Center(
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        onPressed: () {
                                          GetClinicImageCubit.get(context)
                                              .getProfileImage();
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                        EditInfoRow(
                          title: "Name",
                          controller: nameController,
                          inputType: TextInputType.name,
                        ),
                        EditInfoRow(
                          title: "Phone",
                          controller: phoneController,
                          inputType: TextInputType.phone,
                        ),
                        EditInfoRow(
                          title: "Address",
                          controller: addressController,
                          inputType: TextInputType.streetAddress,
                        ),
                        EditInfoRow(
                          isNumber: true,
                          title: "Price",
                          controller: priceController,
                          inputType: TextInputType.number,
                        ),
                        EditInfoRow(
                          title: "Description",
                          controller: descriptionController,
                          inputType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                ),
                BlocConsumer<GetClinicAppointmentsCubit,
                    GetClinicAppointmentState>(
                  listener: (context, state) {
                    if (state is GetClinicAppointmentFailure) {
                      callMyToast(
                          massage: state.failure.message,
                          state: ToastState.ERROR);
                    }
                  },
                  builder: (context, state) {
                    if (state is GetClinicAppointmentSuccess) {
                      appointments = state.appointmentModels;

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  "Appointments  ${appointments.length}",
                                  style: StyleManager.mainTextStyle15.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: ColorsManager.primary,
                                  ),
                                  onPressed: () {
                                    appointments.add(
                                      AppointmentModel(isNew: true),
                                    );
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Container(
                                    margin: const EdgeInsets.only(bottom: 20.0),
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: ColorsManager.white,
                                      borderRadius: StyleManager.borderRadius,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Appointment ${index + 1}",
                                              style: StyleManager
                                                  .mainTextStyle15
                                                  .copyWith(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const Spacer(),
                                            if (index != 0)
                                              appointments[index].isDeleted
                                                  ? IconButton(
                                                      icon: const Icon(
                                                        Icons.undo,
                                                        color: ColorsManager
                                                            .primary,
                                                      ),
                                                      onPressed: () {
                                                        appointments[index]
                                                            .isDeleted = false;
                                                        setState(() {});
                                                      },
                                                    )
                                                  : IconButton(
                                                      icon: const Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        color: Colors.red,
                                                      ),
                                                      onPressed: () {
                                                        appointments[index]
                                                            .isDeleted = true;
                                                        setState(() {});
                                                      },
                                                    ),
                                          ],
                                        ),
                                        if (!appointments[index].isDeleted)
                                          Column(
                                            children: [
                                              DropdownButtonFormField<int>(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Select a day',
                                                ),
                                                value: appointments[index].day,
                                                items: daysOfWeek.map((day) {
                                                  return DropdownMenuItem<int>(
                                                    value: day['value'],
                                                    child: Text(day['name']),
                                                  );
                                                }).toList(),
                                                onChanged: (int? newValue) {
                                                  setState(() {
                                                    appointments[index].day =
                                                        newValue;
                                                  });
                                                },
                                                validator: (value) =>
                                                    value == null
                                                        ? 'Please select a day'
                                                        : null,
                                              ),
                                              Row(
                                                children: [
                                                  appointmentFieldBuilder(
                                                      index: index,
                                                      isFrom: true),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  appointmentFieldBuilder(
                                                      index: index,
                                                      isFrom: false),
                                                ],
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 20.0),
                              itemCount: appointments.length),
                        ],
                      );
                    } else if (state is GetClinicAppointmentLoading) {
                      return const DefaultLoading();
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appointmentFieldBuilder({required int index, required bool isFrom}) =>
      Expanded(
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'this field is required';
            }
            return null;
          },
          onTap: () async {
            var result = await _selectTime(context);
            if (isFrom) {
              appointments[index].from = result;
            } else {
              appointments[index].to = result;
            }
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: isFrom ? 'From' : 'To',
            focusColor: ColorsManager.primary,
            labelStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
          controller: TextEditingController(
            text: isFrom
                ? appointments[index].from == null
                    ? null
                    : appointments[index].from!.timeOfDay
                : appointments[index].to == null
                    ? null
                    : appointments[index].to!.timeOfDay,
          ),
        ),
      );

  Future<DateTimeFirebaseManager?> _selectTime(BuildContext context) async {
    DateTime? selectedTime;
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final now = DateTime.now();
      setState(() {
        selectedTime =
            DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      });
    }
    return DateTimeFirebaseManager(
        dateTime:
            selectedTime == null ? null : Timestamp.fromDate(selectedTime!),
        timeOfDay: picked == null ? null : picked.format(context));
  }
}
