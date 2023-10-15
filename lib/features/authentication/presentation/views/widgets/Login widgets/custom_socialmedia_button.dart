import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';

class CustomSocialMediaButton extends StatelessWidget {
  const CustomSocialMediaButton({
    super.key,
  });

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
            'assets/images/google.png',
            width: 40,
            height: 40,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 30,
          ),
          const Text('Google'),
        ],
      ),
    );
  }
}
