import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Center(
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
            prefixIcon: const Icon(Icons.password),
            labelText: 'Password',
          ),
        ),
      ),
    );
  }
}
