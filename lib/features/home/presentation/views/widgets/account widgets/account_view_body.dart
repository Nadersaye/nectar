import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../data/models/account_model.dart';
import 'account_list_view.dart';
import 'logout_button.dart';
import 'user_details_listtile.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key, required this.accountItems});
  final List<AccountModel> accountItems;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const UserDetailsListTile(),
          const Divider(
            height: 1,
            color: AppColors.lightGray,
          ),
          Expanded(
              child: AccountListview(
            accountItems: accountItems,
          )),
          const LogoutAccountButton()
        ],
      ),
    );
  }
}
