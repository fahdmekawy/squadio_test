import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:squadio_test/models/user_model/login_model.dart';
import 'package:squadio_test/models/user_model/login_response.dart';

class LoginRepository {
  static Future<LoginResponse> loginUser(
      {required LoginModel loginModel, required String? subDomain}) async {
    var response = await http.post(
      Uri.parse('https://$subDomain/tenant/login'),
      body: jsonEncode(loginModel.toJson()),
      headers: {
        "Accept": "application/json",
        "x-api-key":
            "iqT0B2obq3oerbeXkDVLjZrrLheW4d8fOUQYCny6tj2TYDlTuu1KsnUyaLkeObwatkc8EqJ6cgo6y"
      },
    );
    return LoginResponse.fromJson(
        const JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
