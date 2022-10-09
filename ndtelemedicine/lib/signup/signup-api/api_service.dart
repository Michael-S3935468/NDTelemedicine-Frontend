import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/signup.dart';

class SignupAPI{
  Future<SignupRequest> sendSignup(SignupRequest request) async {
    var url = Uri.parse('http://localhost:8080/item/time');
    final http.Response response = await http.post(
        url,
        headers: {
          "Access-Control_Allow_Origin": "*",
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: signupRequestToJson(request)
    );

    if (response.statusCode == 201) {
      return signupRequestFromJson(response.body);
    } else {
      throw Exception("Failed to Signup");
    }
  }
}