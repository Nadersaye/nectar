import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomCheckBoxRow extends StatefulWidget {
  const CustomCheckBoxRow({
    super.key,
  });

  @override
  State<CustomCheckBoxRow> createState() => _CustomCheckBoxRowState();
}

class _CustomCheckBoxRowState extends State<CustomCheckBoxRow> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = !isChecked;
            });
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
            'Forget password ?',
            style: Styles.styleMagnoliaWhite16.copyWith(
                color: AppColors.oceanGreen, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
