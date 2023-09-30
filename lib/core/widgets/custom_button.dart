import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

// ignore: must_be_immutable
class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.buttonText,
    this.onTap,
  });
  final void Function()? onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 67,
        decoration: BoxDecoration(
            color: AppColors.oceanGreen,
            borderRadius: BorderRadius.circular(19)),
        child: Center(
          child: Text(
            buttonText,
            style: Styles.styleBlackRussian18
                .copyWith(color: AppColors.magnoliaWhite),
          ),
        ),
      ),
    );
  }
}
