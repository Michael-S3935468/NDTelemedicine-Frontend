import 'dart:convert';

import 'Doctor.dart';
import 'Patient.dart';

// Appointment appointmentFromJson(String str) => Appointment.fromJson(json.decode(str));
//
// String appointmentToJson(Appointment data) => json.encode(data.toJson());

List<Appointment>? appointmentFromJson(String str) => List<Appointment>.from(json.decode(str).map((x) => Appointment.fromJson(x)));

String appointmentToJson(List<Appointment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Model class for Appointments
class Appointment {

  late DateTime start;
  late DateTime end;
  late String label;
  late Doctor doctor;
  late Patient? patient;

  Appointment({required this.start, required this.end, required this.label, required this.doctor, required this.patient});

  Appointment.unbooked({required this.start, required this.end, required this.label});

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    start: json["start"],
    end: json["end"],
    label: json["label"],
    doctor: Doctor.fromJson(json["Doctor"]),
    patient: Patient.fromJson(json["Patient"]),
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
    "label": label,
    "Doctor": doctor.toJson(),
    "Patient": patient?.toJson(),
  };
}

// Convert JSON to List of List of Strings for available timeslots for a doctor
List<List<String>> availableTimesFromJson(String str) => List<List<String>>.from(json.decode(str).map((x) => List<String>.from(x.map((x) => x))));

// Function that creates booking slots of 15 minute intervals given a time range
List<Appointment> fromTime(String s, String e, DateTime date) {

  // Get hour and minute for time range
  List<String> periodStart = s.split(":");
  List<String> periodEnd = e.split(":");

  List<Appointment> appointments = [];

  // Construct a new date from time provided
  DateTime startTime = DateTime(date.year, date.month, date.day, int.parse(periodStart[0]), int.parse(periodStart[1]));
  DateTime endTime = DateTime(date.year, date.month, date.day, int.parse(periodEnd[0]), int.parse(periodEnd[1]));

  // Create Appointments
  while (startTime != endTime) {
    if (startTime.isAfter(DateTime.now())) {
      appointments.add(Appointment.unbooked(
          start: startTime,
          end: startTime.add(const Duration(minutes: 15)),
          label:
              "${startTime.hour}:${startTime.minute}${startTime.minute == 0 ? 0 : ""} - ${startTime.add(const Duration(minutes: 15)).hour}:${startTime.add(const Duration(minutes: 15)).minute}${startTime.minute == 45 ? 0 : ""}"));
    }
    startTime = startTime.add(const Duration(minutes: 15));
  }

  return appointments;
}