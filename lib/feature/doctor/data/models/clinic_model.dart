import 'package:image_picker/image_picker.dart';

class ClinicModel {
  String? name;
  String? address;
  String? phone;
  String? description;
  XFile? image;
  String? imagePath;
  List<AppointmentModel>? appointments;

  ClinicModel({
    this.name,
    this.address,
    this.phone,
    this.description,
    this.image,
    this.imagePath,
    this.appointments,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      description: json['description'],
      imagePath: json['imagePath']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'description': description,
      'imagePath': imagePath,
    };
  }

}

class AppointmentModel{
   int? _day ;
   String? dayName;
   DateTimeFirebaseManager? from;
   DateTimeFirebaseManager? to;
   String? clinicId;

   AppointmentModel({
   this.from,
   this.to,
    this.clinicId,
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
      from: DateTimeFirebaseManager(timeOfDay: json['fromTime'], dateTime: json['from']),
       to: DateTimeFirebaseManager(timeOfDay: json['toTime'], dateTime: json['to']),
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
   };
   }
}


class DateTimeFirebaseManager
{
  DateTime? dateTime;
  String? timeOfDay;
  DateTimeFirebaseManager({this.dateTime,this.timeOfDay});
}