import 'package:flutter/material.dart';

class AccountModel {
  late String title;
  late IconData leadingIcon;
  late IconData trailingIcon;
  late Function onTap;
  AccountModel(this.title, this.leadingIcon, this.trailingIcon, this.onTap);
}
