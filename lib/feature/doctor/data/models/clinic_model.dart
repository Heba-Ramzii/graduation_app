import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ClinicModel {
  String? name;
  String? address;
  String? phone;
  String? description;
  XFile? image;
  String? imagePath;
  List<AppointmentModel>? appointments;
  int? price;
  String? id;

  ClinicModel({
    this.name,
    this.address,
    this.phone,
    this.description,
    this.image,
    this.imagePath,
    this.appointments,
    this.price,
    this.id,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      description: json['description'],
      imagePath: json['imagePath'],
      price: json['price'],
      id: json['id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'description': description,
      'imagePath': imagePath,
      'price': price,
      'id': id
    };
  }
}

class AppointmentModel {
  int? _day;
  String? dayName;
  DateTimeFirebaseManager? from;
  DateTimeFirebaseManager? to;
  String? clinicId;
  String? id;
  bool isDeleted;
  bool isNew;

  AppointmentModel({
    this.from,
    this.to,
    this.id,
    this.clinicId,
    this.isDeleted = false,
    this.isNew = false,
  });

  int? get day {
    return _day;
  }

  set day(int? value) {
    _day = value;
    switch (value) {
      case 6:
        dayName = 'Saturday';
        break;
      case 7:
        dayName = 'Sunday';
        break;
      case 1:
        dayName = 'Monday';
        break;
      case 2:
        dayName = 'Tuesday';
        break;
      case 3:
        dayName = 'Wednesday';
        break;
      case 4:
        dayName = 'Thursday';
        break;
      case 5:
        dayName = 'Friday';
        break;
    }
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    AppointmentModel appointmentModel = AppointmentModel(
      id: json['id'],
      from: DateTimeFirebaseManager(
          timeOfDay: json['fromTime'], dateTime: json['from']),
      to: DateTimeFirebaseManager(
          timeOfDay: json['toTime'], dateTime: json['to']),
      clinicId: json['clinicId'],
    );
    appointmentModel.day = json['day'];
    return appointmentModel;
  }

  Map<String, dynamic> toJson() {
    return {
      'day': _day,
      'from': from!.dateTime,
      'to': to!.dateTime,
      'fromTime': from!.timeOfDay,
      'toTime': to!.timeOfDay,
      'clinicId': clinicId,
      'id': id
    };
  }
}

class DateTimeFirebaseManager {
  Timestamp? dateTime;
  String? timeOfDay;
  DateTimeFirebaseManager({this.dateTime, this.timeOfDay});
}
