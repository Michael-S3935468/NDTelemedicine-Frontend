import './User.dart';
import './Patient.dart';


class Doctor extends User {

  Doctor(String firstName, String lastName, String email, int id)
      : super.min(firstName, lastName, email ,id);

  final List<Patient> patients = [];

}