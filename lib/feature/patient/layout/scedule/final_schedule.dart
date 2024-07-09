import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import 'package:graduation_app/feature/patient/cubit/add_new_clinic_booking/add_new_clinic_booking_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/add_new_clinic_booking/add_new_clinic_booking_state.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/widget/scedule/info_column.dart';
import 'package:graduation_app/feature/patient/widget/scedule/time_column.dart';
import '../../../../core/function/core_function.dart';
import '../../widget/scedule/doctor_card.dart';
import '../appointments/appointments_patient_screen.dart';

// ignore: must_be_immutable
class FinalScheduleScreen extends StatefulWidget {
  const FinalScheduleScreen({required this.bookModel,super.key, required this.patientBookModel});
  final BookModel bookModel;
  final PatientBookModel patientBookModel;

  @override
  State<FinalScheduleScreen> createState() => _FinalScheduleScreenState();
}

class _FinalScheduleScreenState extends State<FinalScheduleScreen> {

  // void _showModalSheet(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return Container(
  //           height: 200.0,
  //           color: Colors.green,
  //           child: const Center(
  //             child: Text(" Modal BottomSheet",
  //                 style: TextStyle(
  //                     color: Colors.white, fontWeight: FontWeight.bold)),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule"),
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             DoctorCard(
              clinicModel: widget.bookModel.clinicModel!,
             ),
             TimeColumn(appointmentModel: widget.bookModel.appointmentModel!),
             InfoColumn(patientBookModel: widget.patientBookModel),
             BlocConsumer<AddNewClinicBookingCubit,AddNewClinicBookingState>(
               listener: (context, state) {
                  if(state is AddNewClinicBookingFailed){
                    callMyToast(
                        massage: state.failure.message,
                        state: ToastState.ERROR,
                    );
                  }
                  else if(state is AddNewClinicBookingSuccess) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          // navigateToScreen(
                          //     context, const AppointmentsPatientScreen());
                        });
                        return  Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: AlertDialog(
                            backgroundColor: ColorsManager.white,
                            icon: const Icon(
                              Icons.check_circle_outline_sharp,
                              size: 60,
                              color: ColorsManager.primary,
                            ),
                            title: Text(
                              'Congratulations',
                              textAlign: TextAlign.center,
                              style: StyleManager.textStyle14mid.copyWith(
                                  color: ColorsManager.primary,
                                  fontSize: 24
                              ),
                            ),
                            content:Text('you have Booked successfully',
                              textAlign: TextAlign.center,
                              style: StyleManager.textStyle14.copyWith(
                                  fontSize: 20
                              ),) ,
                            // Other dialog content here...
                          ),
                        );
                      },
                    );
                  }
               },
             builder: (context, state) {
               if(state is AddNewClinicBookingLoading){
                 return const DefaultLoading();
               }
               return  Padding(
                 padding: const EdgeInsets.symmetric(vertical: 20.0),
                 child: CustomMaterialButton(
                   text: "Submit",
                   onPressed: () {
                     AddNewClinicBookingCubit.get(context).addNewBook(
                       bookModel: widget.bookModel,
                       patientBookModel: widget.patientBookModel,
                     );
                   },
                 ),
               );
             },
           ),
          ],
        ),
      ),
    );
  }
}
