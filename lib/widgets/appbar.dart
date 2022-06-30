import 'package:flutter/material.dart';

AppBar buildAppBar(String? title, bool backButton) {
  return AppBar(
    leading: backButton
        ? const BackButton(
            color: Colors.black,
          )
        : const SizedBox(),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text(
      title ?? '',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
