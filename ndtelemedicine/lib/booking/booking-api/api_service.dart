import 'package:http/http.dart' as http;
import '../model/appointment.dart';

class BookingAPI {
  Future<List<Appointment>?> getAppointments(DateTime date) async {
    try {
      // Call Microservice for available appointments
      // TODO: Add endpoint uri
      var url = Uri.parse("PUT API ENDPOINT HERE" "/$date");
      var response = await http.get(url);

      // If response returned, make the appointment list
      if (response.statusCode == 200) {
        AvailableTimes availableTimes = availableTimesFromJson(response.body);
        List<Appointment> appointments = [];

        // Convert the available time slots into booking appointments
        for (var t in availableTimes.times) {
          List<Appointment> temp = fromTime(t[0], t[1], date);
          appointments += temp;
        }

        return appointments;
      }
    } catch (e) {
      print(e);
    }
  }
}