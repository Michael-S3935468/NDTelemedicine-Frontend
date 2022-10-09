// To parse this JSON data, do
//
//     final signupRequest = signupRequestFromJson(jsonString);

import 'dart:convert';

SignupRequest signupRequestFromJson(String str) => SignupRequest.fromJson(json.decode(str));

String signupRequestToJson(SignupRequest data) => json.encode(data.toJson());

class SignupRequest {
  SignupRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.age,
    required this.sex,
    required this.password,
  });

  String firstName;
  String lastName;
  String email;
  int id;
  int age;
  String sex;
  String password;

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    id: json["id"],
    age: json["age"],
    sex: json["sex"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "id": id,
    "age": age,
    "sex": sex,
    "password": password,
  };
}
