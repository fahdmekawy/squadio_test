import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  final String? Function(String?)? validator;
  final bool? isShow;
  final Function()? showPass;

  const PasswordTextField(
      {required this.passwordController,
      this.validator,
      this.isShow ,
      this.showPass});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Center(
        child: TextFormField(
          controller: passwordController,
          validator: validator,
          obscureText: isShow ?? true,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: showPass,
              icon: isShow??true ? const Icon(
                Icons.remove_red_eye,
              ):const Icon(
                Icons.remove_red_eye,color: Colors.blue,
              ),
            ),
            prefixIcon: const Icon(Icons.password),
            labelText: 'Password',
          ),
        ),
      ),
    );
  }
}
