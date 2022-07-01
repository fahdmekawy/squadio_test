import 'package:equatable/equatable.dart';
import 'package:squadio_test/models/user_model/login_response.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginUninitialized extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  const LoginSuccess({required this.loginResponse});

  @override
  List<Object> get props => [loginResponse];
}

class LoginFailed extends LoginState {
  final String? message;

  const LoginFailed({this.message});

  @override
  List<Object> get props => [message ?? ''];
}
