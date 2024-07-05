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
    };
  }
}
