import 'package:flutter/widgets.dart';
import 'package:nectar/core/widgets/custom_divider.dart';

class AccountListview extends StatelessWidget {
  const AccountListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListViewItem();
      },
      separatorBuilder: (BuildContext context, int index) {
        return const CustomDivider();
      },
      itemCount: null,
    );
  }
}
