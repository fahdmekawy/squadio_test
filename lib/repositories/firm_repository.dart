import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:squadio_test/models/firm_model/firm_model.dart';

import '../constants.dart';

class FirmRepository {
  static Future<FirmModel> getFirms() async {

    var response = await http.get(
      Uri.parse(Constants.firmApi),
      headers: {
        "Content-Type": "application/json",
        "x-api-key":"iqT0B2obq3oerbeXkDVLjZrrLheW4d8fOUQYCny6tj2TYDlTuu1KsnUyaLkeObwatkc8EqJ6cgo6y"
        // "Authorization": "Bearer $token"
      },
    );
    return FirmModel.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
