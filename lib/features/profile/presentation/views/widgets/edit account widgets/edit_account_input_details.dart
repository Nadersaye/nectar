import 'package:flutter/widgets.dart';
import '../../../../../../core/widgets/custom_authentication_textformfield.dart';
import 'custom_edit_profile_field.dart';

class EditAccountInputDetails extends StatefulWidget {
  const EditAccountInputDetails(
      {super.key,
      required this.autovalidateMode,
      required this.nameController,
      required this.phoneController});
  final AutovalidateMode autovalidateMode;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  @override
  State<EditAccountInputDetails> createState() =>
      _EditAccountInputDetailsState();
}

class _EditAccountInputDetailsState extends State<EditAccountInputDetails> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomAuthenticationTextformfield(
          autovalidateMode: widget.autovalidateMode,
          controller: widget.nameController,
          type: TextInputType.name,
          label: 'name',
          validate: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your name';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomPhoneNumberField(
          controller: widget.phoneController,
          type: TextInputType.phone,
          label: 'phone number',
          //onChanged: (value) {},
          /*validate: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter the password';
            } else {
              return null;
            }
          },*/
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
