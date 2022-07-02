import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadio_test/bloc/login_bloc/login_bloc.dart';
import 'package:squadio_test/bloc/login_bloc/login_events.dart';
import 'package:squadio_test/bloc/login_bloc/login_states.dart';
import 'package:squadio_test/models/user_model/login_model.dart';
import 'package:squadio_test/repositories/authentication_repositroy.dart';
import 'package:squadio_test/screens/people_screen.dart';
import '../helpers/navigators.dart';
import '../widgets/appbar.dart';
import '../widgets/email_text_field.dart';
import '../widgets/login_button.dart';
import '../widgets/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isShow = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(logOutButton: false, title: 'Login', backButton: false),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state is LoginSuccess) {
              pushName(context, PeopleScreen.routeName);
            } else if (state is LoginFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message ?? '')));
            }
          },
          builder: (context, state) {
            LoginBloc loginBloc = BlocProvider.of(context);
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      EmailTextField(emailController: emailController),
                      SizedBox(height: 16.h),
                      PasswordTextField(
                          isShow: isShow,
                          showPass: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },
                          passwordController: passwordController),
                      SizedBox(height: 16.h),
                      state is LoginLoading
                          ? const Center(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : LoginButton(
                              onTap: () {
                                loginBloc.add(
                                  LoginPressed(
                                    loginModel: LoginModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                              },
                            )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
