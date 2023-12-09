import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import 'package:nectar/features/profile/presentation/manager/phone%20auth%20cubit/phone_auth_cubit.dart';
import '../../../../data/models/user details model/user_details.dart';
import '../../../manager/get user details cubit/get_user_details_cubit.dart';
import '../../../manager/uploud image cubit/uploud_image_cubit.dart';
import '../cached_profile_network_image.dart';
import 'custom_alert_dialog.dart';
import 'edit_account_form.dart';

class EditAccountViewBody extends StatefulWidget {
  const EditAccountViewBody({super.key, required this.user});
  final UserDetailsModel user;

  @override
  State<EditAccountViewBody> createState() => _EditAccountViewBodyState();
}

class _EditAccountViewBodyState extends State<EditAccountViewBody> {
  void _showAlertDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return customAlertDialog(context);
      },
    );
  }

  void _updateProfile(BuildContext context) {
    /*widget.user.photo = BlocProvider.of<UploudImageCubit>(context).myUrl;
    widget.user.save();
    log("${BlocProvider.of<UploudImageCubit>(context).myUrl}");
    BlocProvider.of<GetUserDetailsCubit>(context)
        .getUserDetails(widget.user.id);
    GoRouter.of(context).pop();*/
    BlocProvider.of<PhoneAuthCubit>(context).phoneNumber = phoneController.text;
    GoRouter.of(context).push(AppRoutes.otp);
  }

  Timer? _timer;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  @override
  void initState() {
    nameController = TextEditingController(text: widget.user.name);
    phoneController = TextEditingController(text: widget.user.phoneNumber);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            BlocConsumer<UploudImageCubit, UploudImageState>(
              listener: (BuildContext context, UploudImageState state) async {
                if (state is UploudImageLoading) {
                  await EasyLoading.show(
                    status: 'Processing...',
                    maskType: EasyLoadingMaskType.black,
                  );
                } else {
                  _timer?.cancel();
                  await EasyLoading.dismiss();
                }
              },
              builder: (context, state) {
                if (widget.user.photo != null) {
                  if (state is UploudImageSuccess) {
                    return cachedProfilNetworkImage(imageUrl: state.myUrl);
                  } else {
                    return cachedProfilNetworkImage(
                        imageUrl: widget.user.photo!);
                  }
                } else {
                  return state is UploudImageSuccess
                      ? cachedProfilNetworkImage(imageUrl: state.myUrl)
                      : const SizedBox(
                          height: 20,
                        );
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
                onTap: () => _showAlertDialog(context),
                child: const Text('change')),
            const SizedBox(
              height: 10,
            ),
            EditAccountForm(
              user: widget.user,
              nameController: nameController,
              phoneController: phoneController,
            ),
            CustomActionButton(
              buttonText: 'Update',
              onTap: () => _updateProfile(context),
            ),
          ],
        ),
      ),
    );
  }
}
