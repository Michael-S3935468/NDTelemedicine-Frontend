import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.error,
    required this.reason,
    this.token
  });
    bool success;
    String error;
    String reason;
    String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    error: json["error"],
    reason: json["reason"],
    token: json["token"]
  );

}