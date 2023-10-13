import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class UserDetailsListTile extends StatelessWidget {
  const UserDetailsListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(27),
        child: Image.asset(
          'assets/images/undefined.jpeg',
          height: 64,
          width: 64,
          fit: BoxFit.contain,
        ),
      ),
      title: const CustomUserName(),
      subtitle: Text(
        'ns1582@gmail.com',
        style: Styles.styleMagnoliaWhite16
            .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class CustomUserName extends StatelessWidget {
  const CustomUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
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
