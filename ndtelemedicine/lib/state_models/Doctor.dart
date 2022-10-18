import 'dart:convert';

import './User.dart';
import './Patient.dart';

List<Doctor> doctorFromJson(String str) => List<Doctor>.from(jsonDecode(str).map((x) => Doctor.fromJson(x)));

class Doctor extends User {
  Doctor(User user)
      : super(
            id: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            age: user.age,
            sex: user.sex,
            email: user.email,
            password: user.password);

  final List<Patient> patients = [];

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        User(
            id: json["id"],
            firstName: json["firstName"],
            lastName: json["lastName"],
            age: json["age"],
            sex: json["sex"],
            email: json["email"],
            password: json["password"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "age": age,
    "sex": sex,
    "email": email,
    "password": password,
  };
}
