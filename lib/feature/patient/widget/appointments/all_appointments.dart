import 'package:flutter/cupertino.dart';
import 'package:graduation_app/feature/patient/data/models/book_model.dart';
import 'package:graduation_app/feature/patient/widget/appointments/cancelled_appointment.dart';
import 'package:graduation_app/feature/patient/widget/appointments/completed_appointment.dart';
import 'package:graduation_app/feature/patient/widget/appointments/upcoming_appointment.dart';

class AllAppointments extends StatelessWidget {
  const AllAppointments({super.key, required this.bookModel, required this.patientBookModel});
  final BookModel bookModel ;
  final PatientBookModel patientBookModel;


  @override
  Widget build(BuildContext context) {
    switch (patientBookModel.status) {
      case 1:
        return UpcomingAppointment(bookModel: bookModel, patientBookModel: patientBookModel);
      case 2:
        return CompletedAppointment(bookModel: bookModel);
      case 3:
        return CancelledAppointment(bookModel: bookModel);
      default:
        return  SizedBox(child: Text('data ${patientBookModel.status}'),);
    }
  }
}
