import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class DoctorModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? imagePath;
  String? nationalIdImagePath;
  String? licenseImagePath;
  Timestamp? birthDate;
  bool? isDoctor;
  XFile? image;
  XFile? nationalIdImage;
  XFile? licenseImage;
  String? speciality;
  int? rate;
  int? rateSubmission;
  int? raters;
  String? adminReason;
  bool? adminVerified;
  List<String> patientsID = [];

  DoctorModel(
      {this.id,
      this.name,
      this.email,
      this.birthDate,
      this.isDoctor,
      this.phone,
      this.imagePath,
      this.speciality,
      this.rate,
      this.adminReason,
      this.adminVerified,
      this.licenseImagePath,
      this.nationalIdImagePath,
      this.rateSubmission,
      this.raters});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isDoctor = json['isDoctor'];
    imagePath = json['imagePath'];
    birthDate = json['birthDate'];
    speciality = json['speciality'];
    rate = json['rate'] ==null? 0 : json['rate'].toInt();
    adminReason = json['adminReason'];
    adminVerified = json['adminVerified'];
    licenseImagePath = json['licenseImagePath'];
    nationalIdImagePath = json['nationalIdImagePath'];
    raters = json['raters'] ==null? 0 : json['raters'].toInt();
    rateSubmission = json['rateSubmission'] ==null? 0 : json['rateSubmission'].toInt();

    if (json['patientsID'] != null) {
      patientsID = json['patientsID'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'isDoctor': isDoctor,
      'imagePath': imagePath,
      'birthDate': birthDate,
      'speciality': speciality,
      'rate': rate,
      'adminReason': adminReason,
      'adminVerified': adminVerified,
      'licenseImagePath': licenseImagePath,
      'nationalIdImagePath': nationalIdImagePath,
      'patientsID': patientsID,
      'raters': raters ?? 0,
      'rateSubmission': rateSubmission ?? 0
    };
  }
}
