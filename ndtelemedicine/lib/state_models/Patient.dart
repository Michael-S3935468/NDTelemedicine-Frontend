import 'package:ndtelemedicine/state_models/Appointment.dart';

import './User.dart';
import './Symptom.dart';

class Patient extends User {
  Patient(User user)
      : super(
            id: user.id,
            firstName: user.firstName,
            lastName: user.lastName,
            age: user.age,
            sex: user.sex,
            email: user.email,
            password: user.password);

  List<Symptom> symptoms = [  ];
  List<Appointment> appointments = [];
  String medicalConditions = "";
  String allergies = "";

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(User(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      age: json["age"],
      sex: json["sex"],
      email: json["email"],
      password: json["password"]));

  @override
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