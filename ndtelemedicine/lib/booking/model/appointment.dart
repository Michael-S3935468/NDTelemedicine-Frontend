
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

class Appointment {

  late final String date;
  late final String time;
  late final String booked;

  Appointment({required this.date, required this.time, required this.booked});

  Appointment.fromJson(Map<String, dynamic> json) {
    date =json['date'];
    time = json['time'];
    booked = json['booked'];
  }

}