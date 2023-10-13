import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import 'account_list_view.dart';
import 'logout_button.dart';
import 'user_details_listtile.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UserDetailsListTile(),
        Divider(
          height: 1,
          color: AppColors.lightGray,
        ),
        Expanded(
            child: AccountListview(
          accountItems: [],
        )),
        LogoutAccountButton()
      ],
    );
  }
}
