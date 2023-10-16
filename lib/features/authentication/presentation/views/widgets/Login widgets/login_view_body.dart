import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/models/toast_states.dart';
import 'package:nectar/core/widgets/custom_authentication_textformfield.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_toast_text.dart';
import '../../../manager/cubit/auth_cubit.dart';
import '../another_option_authentication_text.dart';
import 'custom_checkbox_row.dart';
import '../custom_seperator_row.dart';
import '../custom_socialmedia_row.dart';

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
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 45),
                      child: Center(
                        child: Text(
                          'Login Now',
                          style: Styles.styleBlackRussian28
                              .copyWith(color: AppColors.oceanGreen),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: InputLoginDetails(
                          emailController: emailController,
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                          loginCubit: loginCubit),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 25, 40),
                      child: CustomCheckBoxRow(loginCubit: loginCubit),
                    ),
                    ActionAuthWidgets(
                      formkey: formkey,
                      state: state,
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Center(child: AnotherOptionText()),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ActionAuthWidgets extends StatelessWidget {
  const ActionAuthWidgets({
    super.key,
    required this.formkey,
    required this.state,
  });

  final GlobalKey<FormState> formkey;
  final LoginStates state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
          const SizedBox(
            height: 20,
          ),
          const CustomSeperatorRow(),
          const SizedBox(
            height: 30,
          ),
          const CustomSocialMediaRow(),
        ],
      ),
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
      ],
    );
  }
}
