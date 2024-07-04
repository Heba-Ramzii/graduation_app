class AIModel {
  int? id;
  String? image;
  int? resultClass;
  String? result;
  int? doctorId;

  AIModel({this.id, this.image, this.resultClass, this.result, this.doctorId});

  AIModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    resultClass = json['result_class'];
    result = json['result'];
    doctorId = json['doctor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['result_class'] = resultClass;
    data['result'] = result;
    data['doctor_id'] = doctorId;
    return data;
  }
}
