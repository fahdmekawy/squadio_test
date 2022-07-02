import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final String? token;
  final String? domain;

  AuthenticationAuthenticated({this.token, this.domain});

  @override
  List<Object> get props => [token ?? '', domain ?? ''];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
