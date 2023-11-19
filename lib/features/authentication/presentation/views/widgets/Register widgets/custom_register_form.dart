import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/features/authentication/data/models/check_email_model.dart';
import 'package:nectar/features/authentication/presentation/manager/register%20cubit/register_cubit.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'register_input_content.dart';

class CustomRegisterForm extends StatefulWidget {
  const CustomRegisterForm({super.key});

  @override
  State<CustomRegisterForm> createState() => _CustomRegisterFormState();
}

class _CustomRegisterFormState extends State<CustomRegisterForm> {
  var formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  Timer? _timer;
  bool isPassword = true;
  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          _timer?.cancel();
          await EasyLoading.dismiss();
        } else if (state is RegisterSuccess) {
          _timer?.cancel();
          await EasyLoading.showSuccess('Great Success!');
          AppRoutes.router.pushReplacement(AppRoutes.checkEmail,
              extra: CheckEmailModel(
                  title: 'Register', bodyText: 'activate your account'));
        } else {
          _timer?.cancel();
          await EasyLoading.show(
            status: 'loading...',
            maskType: EasyLoadingMaskType.black,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RegisterInputContent(
                autovalidateMode: autovalidateMode,
                usernameController: usernameController,
                emailController: emailController,
                passwordController: passwordController,
              ),
              Center(
                child: CustomActionButton(
                  buttonText: 'Sign up',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<RegisterCubit>(context).validateRegister(
                          emailController, passwordController);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
