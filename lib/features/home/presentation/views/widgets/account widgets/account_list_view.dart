import 'package:flutter/widgets.dart';
import 'package:nectar/core/widgets/custom_divider.dart';
import 'package:nectar/features/home/data/models/account_model.dart';

import 'listview_item.dart';

class AccountListview extends StatelessWidget {
  const AccountListview({super.key, required this.accountItems});
  final List<AccountModel> accountItems;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListviewItem(
          accountItem: accountItems[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const CustomDivider();
      },
      itemCount: accountItems.length,
    );
  }
}
