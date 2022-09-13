
List docList = [
  {
    "name": "Alan Smith",
    "specialist": "General Practitioner",
    "gender": "Male"
  },
  {
    "name": "Roy D. Giambrone",
    "specialist": "Chiropractor",
    "gender": "Male"
  },
  {
    "name": "Mary G. Morin",
    "specialist": "Psychologist",
    "gender": "Female"
  },
];

class Doctor {
  late String name;
  late String specialist;
  late String gender;

  Doctor({required this.name, required this.specialist, required this.gender});

  Doctor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    specialist = json['specialist'];
    gender = json['gender'];
  }
}