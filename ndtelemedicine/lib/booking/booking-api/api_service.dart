import 'package:http/http.dart' as http;
import '../model/appointment.dart';

class BookingAPI {
  Future<List<Appointment>?> getAppointments(DateTime date) async {
    try {
      // Call Microservice for available appointments
      // TODO: Add endpoint uri, using a different project to test json response body format
      var url = Uri.parse('http://localhost:8080/item/time');
      // var url = Uri.parse("PUT API ENDPOINT HERE" "/$date");
      var response = await http.get(url, headers: {
        "Access-Control_Allow_Origin": "*"
      });

      // If response returned, make the appointment list
      if (response.statusCode == 200) {

        // Temporary solution with fixed time slots, used for testing functionality, currently working as intended
        List<List<String>> availableTimes =  availableTimesFromJson(response.body);
        List<Appointment> appointments = [];

        // Convert the available time slots into booking appointments
        for (var t in availableTimes) {
          List<Appointment> temp = fromTime(t[0], t[1], date);
          appointments += temp;
        }

        return appointments;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}