import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/styles.dart';

class CustomProductName extends StatelessWidget {
  const CustomProductName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Red Apple',
      maxLines: 1,
      style: Styles.styleBlackRussian18
          .copyWith(letterSpacing: .1.sp, fontWeight: FontWeight.w700),
    );
  }
}
