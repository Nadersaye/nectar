import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomUserName extends StatelessWidget {
  const CustomUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'nader sayed',
          style:
              Styles.styleTimberGreen20.copyWith(color: AppColors.blackRussian),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.mode_edit_outlined,
            size: 15,
            color: AppColors.oceanGreen,
          ),
        )
      ],
    );
  }
}
