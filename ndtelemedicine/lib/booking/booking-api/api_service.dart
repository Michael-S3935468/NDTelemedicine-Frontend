import 'package:http/http.dart' as http;
import '../../state_models/Appointment.dart';

const int START = 0;
const int END = 1;

class BookingAPI {
  Future<List<Appointment>?> getAppointments(DateTime date) async {
    try {
      // Call Microservice for available appointments
      // TODO: Add endpoint uri, using a different project to test json response body format
      var url = Uri.parse('http://localhost:8080/item/time');
      // var url = Uri.parse("PUT API ENDPOINT HERE" "/$date");
      var response = await http.get(url, headers: {
        "Access-Control-Allow-Origin": "*"
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

  Future<List<Appointment>?> getBooked() async {
    // Temp solution
    List<Appointment> temp = [];

    temp.add(Appointment(start: DateTime(2022, 1, 1, 15, 15), end: DateTime(2022, 1, 1, 15, 30), label: "test"));
    temp.add(Appointment(start: DateTime(2022, 1, 1, 15, 30), end: DateTime(2022, 1, 1, 15, 45), label: "test1"));

    return temp;
  }

  Future<bool> unBookAppointment(Appointment? appointment) async {

    return true;
  }
}