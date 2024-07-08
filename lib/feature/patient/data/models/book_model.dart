import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_app/feature/doctor/data/models/clinic_model.dart';
import 'package:graduation_app/feature/doctor/data/models/doctor_model.dart';
import 'package:graduation_app/feature/patient/data/models/patient_model.dart';
class BookModel {
  Timestamp? date;
  AppointmentModel? appointmentModel;
  String? patientName;
  int? age;
  bool? isSelf;
  bool? isMale;
  String? description;
  String? appointmentId;
  String? id;
  ClinicModel? clinicModel;
  String? clinicId;
  DoctorModel? doctorModel;
  String? doctorId;
  PatientModel? patientModel;
  String? patientId;
  int? status; //1 for pending, 2 for completed, 3 for cancelled
  BookModel({
    this.appointmentModel,
    this.patientName,
    this.age,
    this.isSelf,
    this.isMale,
    this.description,
    this.appointmentId,
    this.id,
    this.clinicModel,
    this.clinicId,
    this.doctorModel,
    this.doctorId,
    this.patientModel,
    this.patientId,
    this.status ,
    this.date,
  });
  //from json
  BookModel.fromJson(Map<String, dynamic> json) {
    patientName = json['patientName'];
    age = json['age'];
    isSelf = json['isSelf'];
    isMale = json['isMale'];
    description = json['description'];
    appointmentId = json['appointmentId'];
    id = json['id'];
    clinicId = json['clinicId'];
    doctorId = json['doctorId'];
    patientId = json['patientId'];
    status = json['status'];
    date = json['date'];
  }
  //to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patientName'] = patientName;
    data['age'] = age;
    data['isSelf'] = isSelf;
    data['isMale'] = isMale;
    data['description'] = description;
    data['appointmentId'] = appointmentId;
    data['id'] = id;
    data['clinicId'] = clinicId;
    data['doctorId'] = doctorId;
    data['patientId'] = patientId;
    data['status'] = status;
    data['date'] = date;
    return data;
  }
}