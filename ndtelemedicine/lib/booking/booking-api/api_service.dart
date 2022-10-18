import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../state_models/Appointment.dart';
import '../../state_models/Doctor.dart';
import '../../state_models/Patient.dart';
import '../../state_models/User.dart';

const int START = 0;
const int END = 1;

class BookingAPI {
  Future<List<Appointment>?> getAppointments(DateTime date, String? jwt) async {
    try {
      var url = Uri.parse('http://localhost:8080/appointment/date/$date');
      var response = await http.get(url, headers: {
        HttpHeaders.accessControlAllowOriginHeader: "*",
        HttpHeaders.authorizationHeader: jwt.toString(),
      });

      // If response returned, make the appointment list
      if (response.statusCode == 200) {
        List<List<String>> availableTimes =  availableTimesFromJson(response.body);
        List<Appointment> appointments = [];

        // Convert the available time slots into booking appointments
        for (var timeSlot in availableTimes) {
          List<Appointment> temp = fromTime(timeSlot[START], timeSlot[END], date);
          appointments += temp;
        }

        return appointments;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> bookAppointment(Appointment? appointment, String? jwt) async {
    try {
      var url = Uri.parse('http://localhost:8080/appointment/book');
      var response = await http.post(url, headers: {
        HttpHeaders.accessControlAllowOriginHeader: "*",
        HttpHeaders.authorizationHeader: jwt.toString(),
      },
      body: jsonEncode(appointment));

      if (response.statusCode == 200) {
        return true;
      }

    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<List<Appointment>?> getUserAppointments(int? id, String? jwt) async {
    try {
      // Call Microservice for available appointments
      var url = Uri.parse('http://localhost:8080/appointment/user/$id');
      var response = await http.get(url, headers: {
        HttpHeaders.accessControlAllowOriginHeader: "*",
        HttpHeaders.authorizationHeader: jwt.toString(),
      });
          // If response returned, make the appointment list
      if (response.statusCode == 200) {
        return appointmentFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> unBookAppointment(Appointment? appointment, String? jwt) async {
    try {
      var url = Uri.parse('http://localhost:8080/appointment/unbook');
      var response = await http.post(url, headers: {
        HttpHeaders.accessControlAllowOriginHeader: "*",
        HttpHeaders.authorizationHeader: jwt.toString(),
      },
          body: jsonEncode(appointment));

      if (response.statusCode == 200) {
        return true;
      }

    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<List<Doctor>?> getDoctors(String? jwt) async {
    try {
      var url = Uri.parse('http://localhost:8080/doctors');
      var response = await http.get(url, headers: {
        HttpHeaders.accessControlAllowOriginHeader: "*",
        HttpHeaders.authorizationHeader: jwt.toString(),
      });

      if (response.statusCode == 200) {
        return doctorFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
