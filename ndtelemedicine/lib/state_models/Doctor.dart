import './User.dart';
import './Patient.dart';


class Doctor extends User {

  Doctor(User user)
      : super(id: user.id, firstName: user.firstName, lastName: user.lastName, age: user.age, sex: user.sex, email: user.email, password: user.password);

  final List<Patient> patients = [];

}