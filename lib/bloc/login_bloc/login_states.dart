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
  final LoginResponse? loginResponse;
  final String? message;

   const LoginSuccess({this.loginResponse, this.message});

}

class LoginFailed extends LoginState {
  final String? message;

  const LoginFailed({this.message});

}