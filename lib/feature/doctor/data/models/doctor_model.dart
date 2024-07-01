class AuthModel {
  String? id;
  String? name;
  String? email;
  String? password;
  bool? isDoctor;

  AuthModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.isDoctor,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      isDoctor: json['isDoctor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'isDoctor': isDoctor
    };
  }
}
