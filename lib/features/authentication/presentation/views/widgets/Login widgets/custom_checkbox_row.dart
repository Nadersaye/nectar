import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../manager/cubit/login_cubit.dart';

class CustomCheckBoxRow extends StatelessWidget {
  const CustomCheckBoxRow({
    super.key,
    required this.loginCubit,
  });
  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: loginCubit.isChecked,
          onChanged: (value) {
            loginCubit.changeCheckBox();
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          side:
              MaterialStateBorderSide.resolveWith(((states) => const BorderSide(
                    color: Color(0xff009c7b),
                  ))),
          activeColor: AppColors.oceanGreen,
          //checkColor: AppColors.oceanGreen,
        ),
        const Text('Remember me '),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            'forget password ?',
            style: Styles.styleGrey14.copyWith(color: AppColors.oceanGreen),
          ),
        )
      ],
    );
  }
}
