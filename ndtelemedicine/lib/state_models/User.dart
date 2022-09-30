import './Sex.dart';

class User {

  User(
    this.firstName,
    this.lastName,
    this.age,
    this.sex,
    this.email,
    this.password,
    this.id
  );

  User.min(
    this.firstName,
    this.lastName,
    this.email,
    this.id
  );

  int? id;
  String? firstName;
  String? lastName;
  int? age;
  Sex? sex;
  String? email;
  String? password;


}