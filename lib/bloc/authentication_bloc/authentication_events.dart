import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  List get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String? token;
  final String? domain;

  LoggedIn({this.token, this.domain});

  List get props => [token, domain];
}

class SaveAuth extends AuthenticationEvent {
  final String? token;
  final String? domain;

  SaveAuth({this.token, this.domain});

  List get props => [token, domain];
}

class LoggedOut extends AuthenticationEvent {
  final String? token;
  final String? domain;

  LoggedOut({this.token, this.domain});

  List get props => [token, domain];
}
