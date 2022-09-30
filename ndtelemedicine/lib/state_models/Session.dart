
import 'package:flutter/material.dart';
import './Patient.dart';

class Session extends ChangeNotifier {

  late final Patient _patient;
  late final String _jwt;

  void setPatient(Patient patient) {
    _patient = patient;
  }

  void setJWT(String jwt) {
    _jwt = jwt;
  }
}