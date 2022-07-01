import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = 'token';
const String SUB_DOMAIN = 'sub_domain';

saveToken(String token) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(TOKEN, token);
}

Future<String?> getToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString(TOKEN);
  return token;
}

deleteToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove(TOKEN);
}

saveDomain(String subdomain) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(SUB_DOMAIN, subdomain);
}

Future<String?> getSubdomain() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? subdomain = sharedPreferences.getString(SUB_DOMAIN);
  return subdomain;
}

deleteSubDomain() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove(SUB_DOMAIN);
}
