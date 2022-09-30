import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/login.dart';

class LoginAPI{
  Future<LoginRequest> sendLogin(LoginRequest request) async {
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
      return LoginRequest.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to login");
    }
  }
}