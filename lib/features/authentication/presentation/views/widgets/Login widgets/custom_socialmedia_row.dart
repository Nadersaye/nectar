import 'package:flutter/material.dart';

import 'custom_socialmedia_button.dart';

class CustomSocialMediaRow extends StatelessWidget {
  const CustomSocialMediaRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSocialMediaButton(),
        CustomSocialMediaButton(),
        /*Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width / 2 - 40,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.grey)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image.asset(
                  'assets/images/facebook.png',
                  color: AppColors.facebookColor,
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              const Text('Facebook'),
            ],
          ),
        )*/
      ],
    );
  }
}
