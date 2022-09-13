
List appointList = [
  {
    "time" : "9:00am - 9:15am",
    "booked" : "available"
  },
  {
    "time" : "9:15am - 9:30am",
    "booked" : "available"
  },
  {
    "time" : "9:30am - 9:45am",
    "booked" : "user"
  },
  {
    "time" : "9:45am - 10:00am",
    "booked" : "available"
  },
  {
    "time" : "10:00am - 10:15am",
    "booked" : "booked"
  },
  {
    "time" : "10:15am - 10:30am",
    "booked" : "available"
  },
  {
    "time" : "10:30am - 10:45am",
    "booked" : "available"
  },
  {
    "time" : "10:45am - 11:00am",
    "booked" : "available"
  },
];

class Appointment {

  late final String time;
  late final String booked;

  Appointment({required this.time, required this.booked});

  Appointment.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    booked = json['booked'];
  }

}