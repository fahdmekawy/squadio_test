// import 'dart:async';
// import 'dart:convert';
// import 'package:bloc/bloc.dart';
// import 'package:squadio_test/models/user_model/login_model.dart';
// import '../../repositories/authentication_repository.dart';
// import 'authentication_events.dart';
// import 'authentication_states.dart';
//
// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   String user;
//
//   AuthenticationBloc(super.initialState);
//   UserModel get userData =>
//       UserModel.fromJson(JsonDecoder().convert(user));
//
//
//   @override
//   Stream<AuthenticationState> mapEventToState(
//       AuthenticationEvent event,
//       ) async* {
//     if (event is AppStarted) {
//       user = await AuthenticationRepository.hasUser();
//       if (user != null) {
//         yield AuthenticationAuthenticated(userResponse: userData);
//       } else {
//         yield AuthenticationUnauthenticated();
//       }
//     } else if (event is LoggedIn) {
//       yield* login(event);
//     } else if (event is SaveAuth) {
//       yield* saveUser(event);
//     } else if (event is LoggedOut) {
//       yield* logOut();
//     }
//   }
//
//   Stream<AuthenticationState> logOut() async* {
//     yield AuthenticationLoading();
//     await AuthenticationRepository.deleteUser();
//
//     yield AuthenticationUnauthenticated();
//   }
//
//   Stream<AuthenticationState> saveUser(SaveAuth event) async* {
//     yield AuthenticationLoading();
//     await AuthenticationRepository.persistUser(event.userModel);
//     user = JsonEncoder().convert(event.user.toJson());
//
//     yield AuthenticationAuthenticated(userResponse: this.userData);
//   }
//
//   Stream<AuthenticationState> login(LoggedIn event) async* {
//     yield AuthenticationLoading();
//     await AuthenticationRepository.persistUser(event.userResponse);
//     user = await AuthenticationRepository.hasUser();
//
//     yield AuthenticationAuthenticated(userResponse: this.userData);
//   }
// }