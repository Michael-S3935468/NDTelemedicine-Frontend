import 'dart:convert';

List appointList = [
  {
    "date" : "15 September 2022",
    "time" : "9:00am - 9:15am",
    "booked" : "available"
  },
  {
    "date" : "15 September 2022",
    "time" : "9:15am - 9:30am",
    "booked" : "available"
  },
  {
    "date" : "22 September 2022",
    "time" : "9:30am - 9:45am",
    "booked" : "user"
  },
  {
    "date" : "22 September 2022",
    "time" : "9:45am - 10:00am",
    "booked" : "available"
  },
  {
    "date" : "23 September 2022",
    "time" : "10:00am - 10:15am",
    "booked" : "booked"
  },
  {
    "date" : "23 September 2022",
    "time" : "10:15am - 10:30am",
    "booked" : "available"
  },
  {
    "date" : "26 September 2022",
    "time" : "10:30am - 10:45am",
    "booked" : "available"
  },
  {
    "date" : "26 September 2022",
    "time" : "10:45am - 11:00am",
    "booked" : "available"
  },
];

AvailableTimes availableTimesFromJson(String str) => AvailableTimes.fromJson(json.decode(str));
//
// String availableTimesToJson(AvailableTimes data) => json.encode(data.toJson());

class AvailableTimes {
  AvailableTimes({
    required this.times,
  });

  List<List<String>> times;

  factory AvailableTimes.fromJson(Map<String, dynamic> json) => AvailableTimes(
    times: List<List<String>>.from(json["times"].map((x) => List<String>.from(x.map((x) => x)))),
  );

  // Map<String, dynamic> toJson() => {
  //   "times": List<dynamic>.from(times.map((x) => List<dynamic>.from(x.map((x) => x)))),
  // };
}


class Appointment {

  late DateTime start;
  late DateTime end;
  late String label;

  Appointment({required this.start, required this.end, required this.label});

  // REMOVE
  late final String time;
  late final String date;
  late final String booked;

  // Appointment({required this.date, required this.time, required this.booked});

  Appointment.fromJson(Map<String, dynamic> json) {
    date =json['date'];
    time = json['time'];
    booked = json['booked'];
  }
  // REMOVE

}

List<Appointment> fromTime(String s, String e, DateTime date) {

  List<String> periodStart = s.split(":");
  List<String> periodEnd = e.split(":");

  List<Appointment> appointments = [];

  DateTime startTime = DateTime(date.year, date.month, date.day, int.parse(periodStart[0]), int.parse(periodStart[1]));
  DateTime endTime = DateTime(date.year, date.month, date.day, int.parse(periodEnd[0]), int.parse(periodEnd[1]));

  while (startTime != endTime) {
    appointments.add(Appointment(start: startTime, end: startTime.add(const Duration(minutes: 15)), label: "${startTime.hour}:${startTime.minute} - ${startTime.add(const Duration(minutes: 15)).hour}:${startTime.add(const Duration(minutes: 15)).minute}"));
    startTime = startTime.add(const Duration(minutes: 15));
  }

  return appointments;
}