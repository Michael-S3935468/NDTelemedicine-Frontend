
import 'package:flutter/material.dart';
import 'package:ndtelemedicine/state_models/User.dart';
import './Patient.dart';

class Session extends ChangeNotifier {

  late Patient? _patient;

  late String? _jwt;

  void setPatient(Patient patient) {
    _patient = patient;
  }

  void setJWT(String jwt) {
    _jwt = jwt;
  }

  Patient? get patient => _patient;

  String? get jwt => _jwt;

  void closeSession() {
    _patient = null;
    _jwt = null;
  }

}