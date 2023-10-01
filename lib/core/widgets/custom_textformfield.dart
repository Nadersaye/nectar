import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar/core/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.searchController, required this.onChanged});
  final TextEditingController searchController;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please enter your search words , must not be empty';
        }
        return null;
      },
      onChanged: onChanged,
      controller: searchController,
      decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: AppColors.honeydew,
          hintText: 'Search store',
          contentPadding: const EdgeInsets.all(15),
          prefixIconColor: AppColors.blackRussian,
          prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
