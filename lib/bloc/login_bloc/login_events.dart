import 'package:equatable/equatable.dart';
import 'package:squadio_test/models/user_model/login_model.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPressed extends LoginEvent {
  final LoginModel loginModel;
  final String? subDomain;

  const LoginPressed({required this.loginModel,required this.subDomain});
}
