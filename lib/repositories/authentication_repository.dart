import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:squadio_test/models/user_model/login_response.dart';


class AuthenticationRepository {
  static const String USER = 'USER';
  // DELETE DATA FROM STORAGE
  static Future<void> deleteUser() async {
    const storage =  FlutterSecureStorage();
    await storage.delete(key: USER);
    return;
  }

  // WRITE VALUE TO STORAGE
  static Future<void> persistUser(LoginResponse loginResponse) async {
    const storage =  FlutterSecureStorage();
    return await storage.write(key: USER, value: const JsonCodec().encode(loginResponse));
  }

  // READ DATA FROM STORAGEs
  static Future<String?> hasUser() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: USER);
  }
}