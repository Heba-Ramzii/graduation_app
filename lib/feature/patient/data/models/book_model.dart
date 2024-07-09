import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:intl/intl.dart';

class BookModel {
  DateFormat dateFormat = DateFormat('MMMM dd, yyyy HH:mm');

  String? id; // date
  Timestamp? date; // date of the appointment

  String? dateToShow;

  AppointmentModel? appointmentModel;
  String? appointmentId;

  ClinicModel? clinicModel;
  String? clinicId;

  DoctorModel? doctorModel;
  String? doctorId;

  int? status; //1 for pending, 2 for current, 3 for completed, 4 for cancelled

  List<PatientBookModel> patientsBookModel = [];

  BookModel({
    this.id,
    this.date,
    this.appointmentModel,
    this.appointmentId,
    this.clinicModel,
    this.clinicId,
    this.doctorModel,
    this.doctorId,
    this.status,
  }) {
    dateToShow = date == null ? null : dateFormat.format(date!.toDate());
  }

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateToShow = date == null ? null : dateFormat.format(date!.toDate());
    appointmentId = json['appointmentId'];
    clinicId = json['clinicId'];
    doctorId = json['doctorId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['appointmentId'] = this.appointmentId;
    data['clinicId'] = this.clinicId;
    data['doctorId'] = this.doctorId;
    data['status'] = this.status;
    return data;
  }
}

class PatientBookModel {
  String? id;
  String? patientId;
  String? bookId; // Book Model id
  String? patientName;
  int? age;
  bool? isSelf;
  bool? isMale;
  String? description;
  int? status; //1 for pending, 2 for completed, 3 for cancelled
  Timestamp? dateTime; // date of the appointment order

  PatientBookModel({
    this.id,
    this.patientId,
    this.bookId,
    this.patientName,
    this.age,
    this.isSelf,
    this.isMale,
    this.description,
    this.status,
    this.dateTime,
  });

  PatientBookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    bookId = json['bookId'];
    patientName = json['patientName'];
    age = json['age'];
    isSelf = json['isSelf'];
    isMale = json['isMale'];
    description = json['description'];
    status = json['status'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['patientId'] = this.patientId;
    data['bookId'] = this.bookId;
    data['patientName'] = this.patientName;
    data['age'] = this.age;
    data['isSelf'] = this.isSelf;
    data['isMale'] = this.isMale;
    data['description'] = this.description;
    data['status'] = this.status;
    data['dateTime'] = this.dateTime;
    return data;
  }
}
