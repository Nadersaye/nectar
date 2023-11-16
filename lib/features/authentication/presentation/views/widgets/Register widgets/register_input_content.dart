import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_authentication_textformfield.dart';

class RegisterInputContent extends StatefulWidget {
  const RegisterInputContent({super.key, required this.autovalidateMode});
  final AutovalidateMode autovalidateMode;
  @override
  State<RegisterInputContent> createState() => _RegisterInputContentState();
}

class _RegisterInputContentState extends State<RegisterInputContent> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool isPassword = true;
  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthenticationTextformfield(
          autovalidateMode: widget.autovalidateMode,
          controller: usernameController,
          type: TextInputType.name,
          label: 'Username',
          validate: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your email';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomAuthenticationTextformfield(
          autovalidateMode: widget.autovalidateMode,
          controller: emailController,
          type: TextInputType.emailAddress,
          label: 'Email address',
          validate: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your email';
            } else {
              return null;
            }
          },
        ),
        CustomAuthenticationTextformfield(
          autovalidateMode: widget.autovalidateMode,
          controller: passwordController,
          type: TextInputType.visiblePassword,
          label: 'Password',
          isPassword: isPassword,
          validate: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter the password';
            } else {
              return null;
            }
          },
          suffixPressed: () {
            setState(() {
              isPassword = !isPassword;
            });
          },
          suffix: isPassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
