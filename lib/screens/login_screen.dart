import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  Widget build(BuildContext context) {
    String? subdomain = ModalRoute.of(context)?.settings.arguments as String?;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  const EmailTextField(),
                  SizedBox(height: 16.h),
                  const PasswordTextField(),
                  SizedBox(height: 16.h),
                  const LoginButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
