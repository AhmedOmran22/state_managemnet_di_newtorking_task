class LoginRequestModel {
  final String email;
  final String password;

  Map<String, dynamic> toJson() => {"email": email, "password": password};

  LoginRequestModel({required this.email, required this.password});
}
