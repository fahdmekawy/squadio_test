// import 'dart:async';
// import 'dart:convert';
// import 'package:bloc/bloc.dart';
// import 'package:squadio_test/models/user_model/login_response.dart';
// import '../../repositories/authentication_repositroy.dart';
// import 'authentication_events.dart';
// import 'authentication_states.dart';
//
// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//
//   late String user;
//
//   LoginResponse get userData =>
//       LoginResponse.fromJson(JsonDecoder().convert(user));
//
//   AuthenticationBloc() : super(AuthenticationUnauthenticated()) {
//     on<AppStarted>((event, emit) async {
//       user = (await AuthenticationRepository.hasUser())!;
//       if (user != null) {
//         emit(AuthenticationAuthenticated(user: userData));
//       } else {
//         emit(AuthenticationUnauthenticated());
//       }
//     });
//
//     on<LoggedIn>((event, emit) => _login);
//     on<SaveAuth>((event, emit) => _saveUser);
//     on<LoggedOut>((event, emit) => _logOut);
//   }
//
//
//   Future<void> _logOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
//     emit(AuthenticationLoading());
//     await AuthenticationRepository.deleteUser();
//     emit(AuthenticationUnauthenticated());
//   }
//
//   Future<void> _saveUser(SaveAuth event,
//       Emitter<AuthenticationState> emit) async {
//     emit(AuthenticationLoading());
//     await AuthenticationRepository.persistUser(event.user);
//     user = JsonEncoder().convert(event.user.toJson());
//
//     emit(AuthenticationAuthenticated(user: this.userData));
//   }
//
//   Future<void> _login(LoggedIn event, Emitter<AuthenticationState> emit) async {
//     emit(AuthenticationLoading());
//     await AuthenticationRepository.persistUser(event.user);
//     user = (await AuthenticationRepository.hasUser())!;
//     emit(AuthenticationAuthenticated(user: this.userData));
//   }
// }
//
//
//
//
