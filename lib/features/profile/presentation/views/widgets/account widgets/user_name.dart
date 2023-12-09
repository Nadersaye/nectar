import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/features/profile/data/models/user%20details%20model/user_details.dart';
import 'package:nectar/features/profile/presentation/views/edit_account_view.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomUserName extends StatelessWidget {
  const CustomUserName({
    super.key,
    required this.user,
  });
  final UserDetailsModel user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          user.name ?? 'undefined',
          style:
              Styles.styleTimberGreen20.copyWith(color: AppColors.blackRussian),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.editAccountView);
          },
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
