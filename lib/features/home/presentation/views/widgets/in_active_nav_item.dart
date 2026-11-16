import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        icon,
        height: 20.h,
        width: 20.w,
      ),
    );
  }
}
