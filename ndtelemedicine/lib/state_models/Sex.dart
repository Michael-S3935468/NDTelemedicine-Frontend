
class Sex {
  static String get MALE => "Male";
  static String get FEMALE => "Female";
  static String get OTHER => "Other";

  final String text;

  Sex({required this.text});

  @override
  String toString() {
    return text;
  }
}