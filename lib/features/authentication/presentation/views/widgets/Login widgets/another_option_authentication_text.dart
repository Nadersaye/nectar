import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class AnotherOptionText extends StatelessWidget {
  const AnotherOptionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.start,
        text: TextSpan(children: [
          TextSpan(
              text: "Don't have an account ?   ",
              style: Styles.styleBlackRussian18),
          TextSpan(
              text: "Register",
              style: Styles.styleBlackRussian18
                  .copyWith(color: AppColors.oceanGreen),
              recognizer: TapGestureRecognizer()..onTap = () {})
        ]));
  }
}
