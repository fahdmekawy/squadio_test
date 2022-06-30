import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:squadio_test/models/user_model/login_model.dart';

abstract class AuthenticationEvent extends Equatable {
  List get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final LoginModel? userModel;

  LoggedIn({this.userModel});

  List get props => ([this.userModel]);

  @override
  String toString() => 'LoggedIn {  $userModel }';
}

class SaveAuth extends AuthenticationEvent {
  final LoginModel? userModel;

  SaveAuth({this.userModel});

  List get props => ([this.userModel]);

  @override
  String toString() => 'LoggedIn {  $userModel }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
