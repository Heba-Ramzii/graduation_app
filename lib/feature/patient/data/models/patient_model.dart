import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class PatientModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? imagePath;
  Timestamp? birthDate;
  bool? isDoctor;
  XFile? image;
  List<String> favoriteDoctors = [];
  List<String> doctorsID = [];

  PatientModel({
    this.id,
    this.name,
    this.email,
    this.birthDate,
    this.isDoctor,
    this.phone,
    this.imagePath,
  });

  PatientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isDoctor = json['isDoctor'];
    imagePath = json['imagePath'];
    birthDate = json['birthDate'];

    if (json['favoriteDoctors'] != null) {
      favoriteDoctors = json['favoriteDoctors'].cast<String>();
    }

    if (json['doctorsID'] != null) {
      doctorsID = json['doctorsID'].cast<String>();
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
      'favoriteDoctors': favoriteDoctors,
      'doctorsID': doctorsID
    };
  }
}
