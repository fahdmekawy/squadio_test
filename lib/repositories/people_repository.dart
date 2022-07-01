import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:squadio_test/models/people_model/people_model.dart';

import '../constants.dart';

class PeopleRepository {
  static Future<PeopleModel> getPeople(
      {required String subDomain, required int page,required String token}) async {
    var response = await http.get(
      Uri.parse('https://$subDomain/tenant/admins?page=$page'),
      headers: {
        "x-api-key":
            "iqT0B2obq3oerbeXkDVLjZrrLheW4d8fOUQYCny6tj2TYDlTuu1KsnUyaLkeObwatkc8EqJ6cgo6y",
        "Authorization": "Bearer $token"
      },
    );
    return PeopleModel.fromJson(
        const JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
