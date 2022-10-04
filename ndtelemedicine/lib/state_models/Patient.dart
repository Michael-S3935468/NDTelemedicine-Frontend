import './User.dart';
import './Symptom.dart';


class Patient extends User {

  Patient(User user)
    : super(id: user.id, firstName: user.firstName, lastName: user.lastName, age: user.age, sex: user.sex, email: user.email, password: user.password);

  final List<Symptom> symptoms = [];
  String medicalConditions = "";
  String allergies = "";


}