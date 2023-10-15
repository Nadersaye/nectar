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
import 'package:nectar/features/authentication/presentation/views/widgets/Login%20widgets/custom_seperator_authentication.dart';
import '../../../../../../core/widgets/custom_toast_text.dart';
import '../../../manager/cubit/login_cubit.dart';
import 'custom_checkbox_row.dart';
import 'custom_socialmedia_button.dart';
import 'custom_socialmedia_row.dart';

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
