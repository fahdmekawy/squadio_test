import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: const BackButton(
      color: Colors.black,
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    title: const Text(
      'Login Screen',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
