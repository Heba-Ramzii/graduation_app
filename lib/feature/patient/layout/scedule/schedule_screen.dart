import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/core_widgets/profile_image.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/cubit/get_doctor_rebook_cubit/get_doctor_rebook_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/get_doctor_rebook_cubit/get_doctor_rebook_state.dart';
import '../../widget/clinic_card.dart';

class ScheduleScreen extends StatelessWidget {
  final DoctorModel doctorModel;
  const ScheduleScreen({
    super.key,
    required this.doctorModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule"),
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImage(
              height: MediaQuery.of(context).size.height * 0.50,
              width: double.infinity,
              url: doctorModel.imagePath,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 6),
              child: Text(
                'Dr. ${doctorModel.name}',
                style: StyleManager.buttonTextStyle16
                    .copyWith(color: ColorsManager.font),
              ),
            ),
            Text(
              doctorModel.speciality ?? '',
            ),
            const SizedBox(height: 30),
            Text(
              "Choose Clinic",
              style: StyleManager.buttonTextStyle16
                  .copyWith(color: ColorsManager.font),
            ),
            ClinicCard(doctorModel: doctorModel),
            const SizedBox(height: 15),
            // Text(
            //   "Choose Time",
            //   style: StyleManager.buttonTextStyle16
            //       .copyWith(color: ColorsManager.font),
            // ),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 20.0),
            //   decoration: StyleManager.containerDecoration,
            //   child: DatePicker(
            //     minDate: DateTime(2024, 1, 1),
            //     maxDate: DateTime(2050, 12, 31),
            //     onDateSelected: (value) {
            //       // Handle selected date
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class RebookScreen extends StatelessWidget {
  final String doctorId;
  const RebookScreen({
    super.key,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule"),
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<GetDoctorRebookCubit, GetDoctorRebookState>(
              listener: (context, state) {
            if (state is GetDoctorRebookFailure) {
              callMyToast(
                  massage: state.failure.message, state: ToastState.ERROR);
            }
          }, builder: (context, state) {
            if (state is GetDoctorRebookSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileImage(
                    height: MediaQuery.of(context).size.height * 0.50,
                    width: double.infinity,
                    url: state.doctorModel.imagePath,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 6),
                    child: Text(
                      'Dr. ${state.doctorModel.name}',
                      style: StyleManager.buttonTextStyle16
                          .copyWith(color: ColorsManager.font),
                    ),
                  ),
                  Text(
                    state.doctorModel.speciality ?? '',
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Choose Clinic",
                    style: StyleManager.buttonTextStyle16
                        .copyWith(color: ColorsManager.font),
                  ),
                  ClinicCard(doctorModel: state.doctorModel),
                  const SizedBox(height: 15),
                ],
              );
            } else if (state is GetDoctorRebookLoading) {
              return const DefaultLoading();
            }

            return const SizedBox();
          })),
    );
  }
}
