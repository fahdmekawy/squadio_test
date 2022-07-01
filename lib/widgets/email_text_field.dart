import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final String? Function(String?)? validator;

  const EmailTextField({required this.emailController, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Center(
        child: TextFormField(
          validator: validator,
          controller: emailController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.email),
            labelText: 'Email',
          ),
        ),
      ),
    );
  }
}
