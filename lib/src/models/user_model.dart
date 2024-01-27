class UserModel {
  String userID;
  String username;
  String password;
  String email;
  bool gender;

  DateTime? registrationDate;

  UserModel({
    required this.userID,
    required this.username,
    required this.password,
    required this.email,
    required this.gender,
    this.registrationDate,

  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      gender: json['gender'],
      registrationDate: DateTime.parse(json['registrationDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'username': username,
      'password': password,
      'email': email,
      'gender': gender,
      'registrationDate': registrationDate!.toIso8601String(),
    };
  }
}
