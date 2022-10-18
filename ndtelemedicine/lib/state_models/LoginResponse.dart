import 'dart:convert';

import 'User.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
LoginResponse loginResponseFailFromJson(String str) => LoginResponse.fromJsonFail(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.error,
    required this.reason,
    required this.token,
    required this.user
  });
    bool success;
    String? error;
    String? reason;
    String? token;
    User? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    error: json["error"],
    reason: json["reason"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  factory LoginResponse.fromJsonFail(Map<String, dynamic> json) => LoginResponse(
      success: json["success"],
      error: json["error"],
      reason: json["reason"],
      token: null,
      user: null
  );
}
