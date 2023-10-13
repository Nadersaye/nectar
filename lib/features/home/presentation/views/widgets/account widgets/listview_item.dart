import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

class ListviewItem extends StatelessWidget {
  const ListviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.abc_outlined,
        size: 20,
        color: AppColors.blackRussian,
      ),
      title: Text(
        '',
        style: Styles.styleBlackRussian18,
      ),
      trailing: const Icon(
        Icons.abc_outlined,
        size: 15,
        color: AppColors.blackRussian,
      ),
      onTap: () {},
    );
  }
}
