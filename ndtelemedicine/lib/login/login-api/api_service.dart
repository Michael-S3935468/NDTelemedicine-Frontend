import 'dart:io';

import 'package:http/http.dart' as http;
import '../model/LoginResponse.dart';
import '../model/login.dart';

class LoginAPI {
  Future<LoginResponse> sendLogin(LoginRequest request) async {
    var url = Uri.parse('http://localhost:8080/api/users/login');
    var response = await http.post(url,
        headers: {
          HttpHeaders.accessControlAllowOriginHeader: "*",
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: loginRequestToJson(request));

    if (response.statusCode == 200) {
      return loginResponseFromJson(response.body);
    } else if (response.statusCode == 401) {
      return loginResponseFailFromJson(response.body);
    } else {
      throw Exception("Failed to login");
    }
  }
}
