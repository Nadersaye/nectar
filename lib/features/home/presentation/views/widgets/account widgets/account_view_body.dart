import 'package:flutter/material.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/utils/colors.dart';
import 'account_list_view.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(27),
            child: Image.asset(
              'assets/images/undefined.jpeg',
              height: 64,
              width: 64,
              fit: BoxFit.contain,
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'nader sayed',
                style: Styles.styleTimberGreen20
                    .copyWith(color: AppColors.blackRussian),
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
          ),
          subtitle: Text(
            'ns1582@gmail.com',
            style: Styles.styleMagnoliaWhite16
                .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
          ),
        ),
        const Divider(
          height: 1,
          color: AppColors.lightGray,
        ),
        const Expanded(child: AccountListview()),
      ],
    );
  }
}
