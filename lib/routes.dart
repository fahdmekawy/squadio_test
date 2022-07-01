import 'package:flutter/material.dart';
import 'package:squadio_test/screens/home_screen.dart';
import 'package:squadio_test/screens/login_screen.dart';
import 'package:squadio_test/screens/people_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  PeopleScreen.routeName: (context) => const PeopleScreen(),
};
