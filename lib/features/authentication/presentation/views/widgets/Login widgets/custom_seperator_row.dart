import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import 'custom_seperator_authentication.dart';

class CustomSeperatorRow extends StatelessWidget {
  const CustomSeperatorRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSeperatorAuthentication(),
        const SizedBox(
          width: 2,
        ),
        Text(
          'OR Login using',
          style: Styles.styleGrey14,
        ),
        const SizedBox(
          width: 2,
        ),
        const CustomSeperatorAuthentication(),
      ],
    );
  }
}
