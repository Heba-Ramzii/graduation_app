class AuthModel {
   String? id;
   String? name;
   String? email;
   String? password;

  AuthModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}