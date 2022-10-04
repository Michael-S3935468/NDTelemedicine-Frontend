
class User {

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.sex,
    required this.email,
    required this.password,
  });

  int id;
  String firstName;
  String lastName;
  int age;
  String sex;
  String email;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    age: json["age"],
    sex: json["sex"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "age": age,
    "sex": sex,
    "email": email,
    "password": password,
  };
}