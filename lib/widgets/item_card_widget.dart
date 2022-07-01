import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCardWidget extends StatelessWidget {
  final String? name;

  const ItemCardWidget({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black87)),
        child: Center(
            child: Text(
              textAlign: TextAlign.center,
              name ?? '',
              style: TextStyle(
                fontSize: 14.sp,
              ),
              maxLines: 2,
            )),
      ),
    );
  }
}
