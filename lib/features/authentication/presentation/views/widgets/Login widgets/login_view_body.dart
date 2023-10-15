import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/models/toast_states.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:nectar/core/widgets/custom_authentication_textformfield.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_toast_text.dart';
import '../../../manager/cubit/login_cubit.dart';
import 'custom_checkbox_row.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccesState) {
          customToastText(
              toastMessage: 'successful logged', state: ToastStates.success);
        } else if (state is LoginErrorState) {
          customToastText(
              toastMessage: 'please enter correct data',
              state: ToastStates.error);
        }
      },
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InputLoginDetails(
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      loginCubit: loginCubit),
                  CustomCheckBoxRow(loginCubit: loginCubit),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Center(
                    child: ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (context) {
                        return CustomActionButton(
                          buttonText: 'Login',
                          onTap: () {
                            if (formkey.currentState!.validate()) {}
                          },
                        );
                      },
                      fallback: (context) => const CircularProgressIndicator(),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.037,
                  ),
                  const CustomSeperatorRow(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.028,
                  ),
                  const CustomSocialMediaRow(),
                  SizedBox(
                    height: 140.h,
                  ),
                  const Center(
                    child: CustomHaveAccountText(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class InputLoginDetails extends StatelessWidget {
  const InputLoginDetails({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.loginCubit,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomAuthenticationTextformfield(
          controller: emailController,
          type: TextInputType.emailAddress,
          label: 'Email address',
          validate: (value) {
            if (value == null || value.isEmpty) {
              /*customToastText(
                toastMessage: 'Please enter your email', state: ToastStates.error);*/
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
          controller: passwordController,
          type: TextInputType.visiblePassword,
          label: 'Password',
          isPassword: LoginCubit.get(context).isPassword,
          validate: (value) {
            if (value == null || value.isEmpty) {
              /*customToastText(
                toastMessage: 'Please enter your email', state: ToastStates.error);*/
              return 'Please enter the password';
            } else {
              return null;
            }
          },
          suffixPressed: () {
            LoginCubit.get(context).changePasswordVisabilty();
          },
          suffix: LoginCubit.get(context).isPassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomAuthenticationTextformfield(
          controller: confirmPasswordController,
          type: TextInputType.visiblePassword,
          label: 'Confirm password',
          isPassword: LoginCubit.get(context).isConfirmPassword,
          suffix: loginCubit.isConfirmPassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          suffixPressed: () {
            LoginCubit.get(context).changeConfirmPasswordVisabilty();
          },
        ),
      ],
    );
  }
}

class CustomHaveAccountText extends StatelessWidget {
  const CustomHaveAccountText({
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

class CustomSocialMediaRow extends StatelessWidget {
  const CustomSocialMediaRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSocialMediaButton(),
        CustomSocialMediaButton(),
        /*Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width / 2 - 40,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.grey)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image.asset(
                  'assets/images/facebook.png',
                  color: AppColors.facebookColor,
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              const Text('Facebook'),
            ],
          ),
        )*/
      ],
    );
  }
}

class CustomSocialMediaButton extends StatelessWidget {
  const CustomSocialMediaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width / 2 - 40,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/google.png',
            width: 40,
            height: 40,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 30,
          ),
          const Text('Google'),
        ],
      ),
    );
  }
}

class CustomSeperatorRow extends StatelessWidget {
  const CustomSeperatorRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSeperatorLogin(),
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
        const CustomSeperatorLogin(),
      ],
    );
  }
}

class CustomSeperatorLogin extends StatelessWidget {
  const CustomSeperatorLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.20000000298023224,
      child: Container(
          width: 70,
          height: 2,
          decoration: const BoxDecoration(color: AppColors.blackRussian)),
    );
  }
}
