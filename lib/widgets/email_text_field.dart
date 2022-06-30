import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmailTextField extends StatelessWidget {
  const EmailTextField({
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
