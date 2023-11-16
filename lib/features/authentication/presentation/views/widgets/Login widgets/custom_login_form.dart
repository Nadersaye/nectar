import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'custom_checkbox_row.dart';
import 'input_login_details.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({
    super.key,
  });
  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: InputLoginDetails(
              autovalidateMode: autovalidateMode,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 25, 40),
            child: CustomCheckBoxRow(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: CustomActionButton(
                buttonText: 'Login',
                onTap: () {
                  if (formkey.currentState!.validate()) {
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*

        if (state is LoginSuccesState) {
          customToastText(
              toastMessage: 'successful logged', state: ToastStates.success);
        } else if (state is LoginErrorState) {
          customToastText(
              toastMessage: 'please enter correct data',
              state: ToastStates.error);
        }
 */