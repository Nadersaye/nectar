import 'package:flutter/material.dart';

class CustomAuthenticationTextformfield extends StatelessWidget {
  const CustomAuthenticationTextformfield(
      {super.key,
      required this.controller,
      required this.type,
      this.validate,
      this.onSubmit,
      this.onChanged,
      required this.label,
      this.prefix,
      this.suffix,
      this.onTap,
      required this.isPassword,
      this.suffixPressed,
      required this.radius,
      required this.fontStyle,
      required this.width});
  final TextEditingController controller;
  final TextInputType type;
  final FormFieldValidator<String>? validate;
  final ValueChanged<String>? onSubmit;
  final Function(String)? onChanged;
  final String label;
  final IconData? prefix;
  final IconData? suffix;
  final GestureTapCallback? onTap;
  final bool isPassword;
  final VoidCallback? suffixPressed;
  final double radius;
  final TextStyle fontStyle;
  final double width;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      //textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (s) {
        debugPrint(s);
      },
      onTap: onTap,
      onChanged: onChanged,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: fontStyle,
        suffixIcon: suffix != Null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
/*
Widget defaultFormField2({
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator<String>? validate,
  ValueChanged<String>? onSubmit,
  Function? onChanged,
  required String label,
  IconData? prefix,
  IconData? suffix,
  GestureTapCallback? onTap,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  double Radiu = 8,
  double fsize = 14,
  FontWeight fweight = FontWeight.w500,
  Color? fcolor = const Color(0xff009c7b),
  String ffamily = "ReadexPro",
  FontStyle fstyle = FontStyle.normal,
  required double width,
}) =>
    Opacity(
      opacity: .5,
      child: TextFormField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s) {
          print(s);
        },
        onTap: onTap,
        onChanged: onSubmit,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: fcolor,
              fontWeight: fweight,
              fontFamily: ffamily,
              fontStyle: fstyle,
              fontSize: fsize),
          suffixIcon: suffix != Null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(Radiu)),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
 */