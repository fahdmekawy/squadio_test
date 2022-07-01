import 'package:flutter/material.dart';

AppBar buildAppBar({String? title, bool backButton=true,bool logOutButton=false,void Function()? logout}) {
  return AppBar(
    leading: backButton
        ? const BackButton(
            color: Colors.black,
          )
        : const SizedBox(),
    actions: [
      logOutButton?IconButton(
        onPressed: logout,
        icon: Icon(
          Icons.logout,
          color: Colors.green[700],
        ),
      ):const SizedBox(),
    ],
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
