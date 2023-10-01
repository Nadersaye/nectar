import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/utils/constants.dart';

import '../utils/colors.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.items});
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
        dotsCount: items.length,
        position: currentIndex,
        decorator: DotsDecorator(
          size: const Size.square(6.0),
          activeSize: const Size(16.0, 6.0),
          activeColor: AppColors.oceanGreen,
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
        ));
  }
}
