import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar/features/home/presentation/views/widgets/account%20widgets/account_view_body.dart';

import '../../../data/models/account_model.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  List<AccountModel> accountItems = [
    AccountModel(
        title: 'Orders', leadingIcon: Icons.local_mall_outlined, onTap: () {}),
    AccountModel(
        title: 'My Details',
        leadingIcon: FontAwesomeIcons.addressCard,
        onTap: () {}),
    AccountModel(
        title: 'Delivery Address',
        leadingIcon: Icons.location_on_outlined,
        onTap: () {}),
    AccountModel(
        title: 'Payment Methods',
        leadingIcon: FontAwesomeIcons.creditCard,
        onTap: () {}),
    AccountModel(
        title: 'Promo Cord', leadingIcon: Icons.sell_outlined, onTap: () {}),
    AccountModel(
        title: 'Notifications',
        leadingIcon: Icons.notification_important_outlined,
        onTap: () {}),
    AccountModel(
        title: 'Help', leadingIcon: Icons.help_outline_outlined, onTap: () {}),
    AccountModel(
        title: 'About', leadingIcon: Icons.info_outlined, onTap: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    return AccountViewBody(
      accountItems: accountItems,
    );
  }
}
