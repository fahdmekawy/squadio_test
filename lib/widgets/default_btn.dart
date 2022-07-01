import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final double? width;

  const DefaultButton({
    this.title,
    this.width,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
        ),
        child: Text(
          title ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
