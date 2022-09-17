
// temp list to test output functions
Object userTest =
  {
    "firstName": "Alan",
    "lastName": "Smith",
    "age": 47,
    "gender": "Male",
    "symptoms": [
      "Cold",
      "Cough",
      "Sore Throat",
      "Headache",
      "Stomachache",
      "Vomiting",
      "High Blood Pressure",
      "Heavy Breathing",
      "Tight Chest",
      "Sore Lower Back Muscles"
    ],
    "appointments": [
      "Appointment 1",
      "Appointment 2",
      "Appointment 3",
      "Appointment 4",
      "Appointment 5",
      "Appointment 6",
      "Appointment 7",
      "Appointment 8",
      "Appointment 9",
      "Appointment 10",
      "Appointment 11",
      "Appointment 12",
    ]
  }
;

class User {

  late final String firstName;
  late final String lastName;
  late final int age;
  late final String gender;
  List<String> symptoms = [];
  List<String> appointments = [];

  User(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.symptoms,
      required this.appointments
      });

  User.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    gender = json['gender'];
    if (json['symptoms'] != null) {
      symptoms.clear();
      json['symptoms'].forEach((k) {
        symptoms.add(k);
      });
    }
    if (json['appointments'] != null) {
      appointments.clear();
      json['appointments'].forEach((k) {
        appointments.add(k);
      });
    }
  }
}