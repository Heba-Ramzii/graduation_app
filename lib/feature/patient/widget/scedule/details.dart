import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/core_widgets/call_my_toast.dart';
import 'package:graduation_app/core/core_widgets/custom_app_bar.dart';
import 'package:graduation_app/core/core_widgets/custom_material_button.dart';
import 'package:graduation_app/core/core_widgets/default_loading.dart';
import 'package:graduation_app/core/theme_manager/colors_manager.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/patient/cubit/delete_book/delete_book_cubit.dart';
import 'package:graduation_app/feature/patient/cubit/delete_book/delete_book_state.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/widget/scedule/info_column.dart';
import 'package:graduation_app/feature/patient/widget/scedule/time_column.dart';
import '../../widget/scedule/doctor_card.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.bookModel, required this.patientBookModel,});
  final BookModel bookModel;
  final PatientBookModel patientBookModel;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Details"),
      backgroundColor: ColorsManager.homePageBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users').doc(widget.bookModel.doctorId).
              collection('clinics').doc(widget.bookModel.clinicId).get(),
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
                  return DoctorCard(
                    clinicModel: ClinicModel.fromJson(data)
                  );
                }

                return Text("loading");
              },
            ),
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users').doc(widget.bookModel.doctorId).
              collection('appointments').doc(widget.bookModel.appointmentId).get(),
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
                  return TimeColumn(appointmentModel: AppointmentModel.fromJson(data));
                }

                return Text("loading");
              },

            ),

            InfoColumn(patientBookModel: widget.patientBookModel),
            BlocConsumer<DeleteBookCubit,DeleteBookState>(
              listener: (context, state) {
                if(state is DeleteBookFailed){
                  callMyToast(
                    massage: state.failure.message,
                    state: ToastState.ERROR,
                  );
                }
                if(state is DeleteBookSuccess){
                  callMyToast(
                    massage: "Book Deleted Successfully",
                    state: ToastState.SUCCESS,
                  );
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if(state is DeleteBookLoading){
                  return const DefaultLoading();
                }
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomMaterialButton(
                    text: "Cancel",
                    onPressed: () {
                      DeleteBookCubit.get(context).deleteBook(
                          widget.patientBookModel
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
