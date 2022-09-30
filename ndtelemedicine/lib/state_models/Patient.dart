import './User.dart';
import './Symptom.dart';


class Patient extends User {

  Patient(String firstName, String lastName, String email, int id)
      : super.min(firstName, lastName, email ,id);


  final List<Symptom> symptoms = [];
  String medicalConditions = "";
  String allergies = "";


}