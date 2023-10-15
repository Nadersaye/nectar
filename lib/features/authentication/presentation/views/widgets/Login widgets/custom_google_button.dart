import 'package:flutter/material.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/utils/colors.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    super.key,
    this.image = 'assets/images/google.png',
    this.socialmediaName = 'Google',
  });
  final String image;
  final String socialmediaName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width / 2 - 40,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey)),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          Text(
            socialmediaName,
            style: Styles.styleBlackRussian18,
          ),
        ],
      ),
    );
  }
}
