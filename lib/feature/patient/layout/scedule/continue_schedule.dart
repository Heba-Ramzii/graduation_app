import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_appointment_cubit/get_clinic_appointment_cubit.dart';
import 'package:graduation_app/feature/doctor/cubit/get_clinic_appointment_cubit/get_clinic_appointment_state.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/layout/scedule/final_schedule.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DayTime {
  final String day;
  final String time;

  DayTime(this.day, this.time);

  @override
  String toString() {
    return '$day - $time';
  }
}

class ContinueScheduleScreen extends StatefulWidget {
  const ContinueScheduleScreen({
    super.key, required this.clinicModel, required this.doctorModel,
  });
  final ClinicModel clinicModel;
  final DoctorModel doctorModel;

  @override
  State<ContinueScheduleScreen> createState() => _ContinueScheduleScreenState();
}

class _ContinueScheduleScreenState extends State<ContinueScheduleScreen> {
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isSelf = true;
  bool isMale = true;

  AppointmentModel? selectedAppointment;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule"),
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Select a Day and Time:'),
              BlocConsumer<GetClinicAppointmentsCubit, GetClinicAppointmentState>(
                listener: (context, state) {

                },
                builder: (context, state) {

                  if (state is GetClinicAppointmentLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is GetClinicAppointmentSuccess) {
                    // dayTimeList = state.appointmentModels.map((appointment) {
                    //   return DayTime(appointment.dayName!, '${appointment.from!.timeOfDay} - ${appointment.to!.timeOfDay}');
                    // }).toList();
                    return DropdownButton<AppointmentModel>(
                      hint: const Text('Select Day and Time'),
                      value: selectedAppointment,
                      onChanged: (AppointmentModel? newValue) {
                        setState(() {
                          selectedAppointment = newValue!;
                        });
                      },
                      items: state.appointmentModels.map<DropdownMenuItem<AppointmentModel>>((AppointmentModel value) {
                        return DropdownMenuItem<AppointmentModel>(
                          value: value,
                          child: Text('${value.dayName}, ${value.from!.timeOfDay} - ${value.to!.timeOfDay}'),
                        );
                      }).toList(),
                    );
                  }
                  return Text('No available appointments');
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Patient Information",
                  style: StyleManager.textStyle18.copyWith(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              ToggleSwitch(
                minWidth: MediaQuery.of(context).size.width,
                initialLabelIndex: isSelf ? 0 : 1,
                totalSwitches: 2,
                borderWidth: 1,
                borderColor: const [
                  ColorsManager.grayFont,
                  ColorsManager.primary,
                ],
                inactiveBgColor: ColorsManager.white,
                inactiveFgColor: ColorsManager.grayFont,
                labels: const ['Your Self', 'Another Person'],
                onToggle: (index) {
                  print('switched to: $index');
                  setState(() {
                    isSelf = !isSelf;
                  });
                },
              ),
              const SizedBox(height: 15),
              Text(
                "Patient name",
                style: StyleManager.buttonTextStyle16.copyWith(
                    color: ColorsManager.primary
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                cursorColor: ColorsManager.primary,
                controller: patientNameController,
              ),
              const SizedBox(height: 10),
              Text(
                "Age",
                style: StyleManager.buttonTextStyle16.copyWith(
                    color: ColorsManager.primary
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your age';
                  }
                  else if(int.tryParse(ageController.text)==null) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
                cursorColor: ColorsManager.primary,
                controller: ageController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ToggleSwitch(
                  minWidth: MediaQuery.of(context).size.width,
                  initialLabelIndex: isMale ? 0 : 1,
                  totalSwitches: 2,
                  borderWidth: 1,
                  borderColor: const [
                    ColorsManager.grayFont,
                    ColorsManager.primary,
                  ],
                  inactiveBgColor: ColorsManager.white,
                  inactiveFgColor: ColorsManager.grayFont,
                  labels: const ['Male', 'Female'],
                  onToggle: (index) {
                    print('switched to: $index');
                    setState(() {
                      isMale = !isMale;
                    });
                  },
                ),
              ),
              Text(
                "Describe Your Case",
                style: StyleManager.buttonTextStyle16.copyWith(
                    color: ColorsManager.font
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your problem';
                    }
                    return null;
                  },
                  controller: descriptionController,
                  cursorColor: ColorsManager.primary,
                  maxLines: 3,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: ColorsManager.primaryBorder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: ColorsManager.primaryBorder),
                    ),
                    filled: true,
                    fillColor: ColorsManager.white,
                    hintText: "Enter the problem ",
                    hintStyle: StyleManager.textStyle12.copyWith(
                      color: ColorsManager.primaryLight,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              CustomMaterialButton(
                text: "Continue",
                onPressed: () {
                  if(selectedAppointment != null) {
                    if (formKey.currentState!.validate()) {
                      final bookModel = BookModel(
                        appointmentModel: selectedAppointment,
                        clinicModel: widget.clinicModel,
                        doctorModel: widget.doctorModel,
                        appointmentId: selectedAppointment!.id,
                        clinicId: widget.clinicModel.id,
                        doctorId: widget.doctorModel.id,
                      );
                      final PatientBookModel patientBookModel = PatientBookModel(
                        patientName: patientNameController.text,
                        age: int.parse(ageController.text),
                        isSelf: isSelf,
                        isMale: isMale,
                        description: descriptionController.text,
                        dateTime: Timestamp.fromDate(DateTime.now())
                      );
                      goTo(context, FinalScheduleScreen(bookModel: bookModel, patientBookModel: patientBookModel));
                    }
                  }
                  else
                  {
                    callMyToast(massage: 'Please select a day and time', state: ToastState.ERROR);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


