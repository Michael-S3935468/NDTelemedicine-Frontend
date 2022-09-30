import 'dart:convert';

List appointList = [
  [
    "12:00:00",
    "15:00:00"
  ],
  [
    "16:30:00",
    "18:00:00"
  ]
];

// Convert JSON to List of List of Strings for available timeslots for a doctor
List<List<String>> availableTimesFromJson(String str) => List<List<String>>.from(json.decode(str).map((x) => List<String>.from(x.map((x) => x))));

// String availableTimesToJson(List<List<String>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))));

// Model class for Appointments
class Appointment {

  late DateTime start;
  late DateTime end;
  late String label;

  Appointment({required this.start, required this.end, required this.label});

}

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
      appointments.add(Appointment(
          start: startTime,
          end: startTime.add(const Duration(minutes: 15)),
          label:
              "${startTime.hour}:${startTime.minute}${startTime.minute == 0 ? 0 : ""} - ${startTime.add(const Duration(minutes: 15)).hour}:${startTime.add(const Duration(minutes: 15)).minute}${startTime.minute == 45 ? 0 : ""}"));
    }
    startTime = startTime.add(const Duration(minutes: 15));
  }

  return appointments;
}