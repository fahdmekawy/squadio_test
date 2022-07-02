import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_test/repositories/authentication_repositroy.dart';
import '../../models/user_model/login_response.dart';
import '../../repositories/login_repository.dart';
import 'login_events.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginUninitialized()) {
    on<LoginPressed>(login);
  }

  Future<void> login(LoginPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final subDomain =await getSubdomain();
      LoginResponse loginResponse = await LoginRepository.loginUser(
          loginModel: event.loginModel, subDomain: subDomain??'');

      if (loginResponse.data != null) {
        await saveToken(loginResponse.data.token);
        emit(LoginSuccess(loginResponse: loginResponse));
      } else {
        emit(LoginFailed(message: loginResponse.message));
      }
    } catch (e) {
      emit(LoginFailed(message: e.toString()));
    }
  }
}
