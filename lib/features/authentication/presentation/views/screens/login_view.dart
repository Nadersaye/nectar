import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

import '../widgets/Login widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Now',
          style: Styles.styleWhite48.copyWith(color: AppColors.oceanGreen),
        ),
        centerTitle: true,
      ),
      body: const LoginViewBody(),
    );
  }
}
