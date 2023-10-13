import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import 'user_name.dart';

class UserDetailsListTile extends StatelessWidget {
  const UserDetailsListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(27),
          child: Image.asset(
            'assets/images/undefined.jpeg',
            height: 64,
            width: 64,
            fit: BoxFit.fill,
          ),
        ),
        title: const CustomUserName(),
        subtitle: Text(
          'ns1582@gmail.com',
          style: Styles.styleMagnoliaWhite16
              .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
