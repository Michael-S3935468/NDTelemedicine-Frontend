
import 'package:flutter/material.dart';
import 'package:ndtelemedicine/booking/model/doctor.dart';
import 'package:ndtelemedicine/state_models/Appointment.dart';

class Booking extends ChangeNotifier {
  late DateTime? _date;
  late Appointment? _toBook;
  late Doctor? _doctor;
  late Appointment? _remove;

  DateTime? get date => _date;
  Appointment? get booking => _toBook;
  Doctor? get doctor => _doctor;
  Appointment? get removing => _remove;

  void setDate(DateTime date) {
    _date = date;
  }

  void setNewAppointment(Appointment appointment) {
    _toBook = appointment;
  }

  void setDoctor(Doctor doctor) {
    _doctor = doctor;
  }

  void setRemoveAppointment(Appointment appointment) {
    _remove = appointment;
  }

  void endSession() {
    _date = null;
    _toBook = null;
    _doctor = null;
    _remove = null;
  }

}