import 'package:flutter/material.dart';
import 'package:nectar/features/profile/data/models/user%20details%20model/user_details.dart';
import 'package:nectar/features/profile/presentation/views/widgets/cached_profile_network_image.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import 'user_name.dart';

class UserDetailsListTile extends StatelessWidget {
  const UserDetailsListTile({
    super.key,
    required this.user,
  });
  final UserDetailsModel user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(27),
          child: cachedProfilNetworkImage(
              imageUrl: user.photo ??
                  'https://modo3.com/thumbs/fit630x300/83832/1480963581/%D8%A8%D8%AD%D8%AB_%D8%B9%D9%86_%D8%B4%D8%B1%D9%83%D8%A9_%D8%A3%D8%A8%D9%84.jpg'),
        ),
        title: CustomUserName(
          user: user,
        ),
        subtitle: Text(
          user.email ?? 'undefined',
          style: Styles.styleMagnoliaWhite16
              .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
