import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/LoginResponse.dart';
import '../model/login.dart';

class LoginAPI{
  Future<LoginResponse> sendLogin(LoginRequest request) async {
    var url = Uri.parse('http://localhost:8080/item/time');
    final http.Response response = await http.post(
        url,
      headers: {
        "Access-Control_Allow_Origin": "*",
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: loginRequestToJson(request)
    );

    if (response.statusCode == 201) {
      return loginResponseFromJson(response.body);
    } else {
      throw Exception("Failed to login");
    }
  }
}