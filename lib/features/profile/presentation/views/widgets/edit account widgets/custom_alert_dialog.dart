import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/function/custom_toast_text.dart';
import '../../../../../../core/models/toast_states.dart';
import '../../../manager/capture photo cubit/capture_photo_cubit.dart';
import '../../../manager/pick image cubit/pick_image_cubit.dart';
import '../../../manager/uploud image cubit/uploud_image_cubit.dart';

customAlertDialog(BuildContext context) {
  return AlertDialog(
    elevation: 3,
    backgroundColor: AppColors.babyGreen,
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          BlocListener<PickImageCubit, PickImageState>(
            listener: (context, state) async {
              var get = BlocProvider.of<PickImageCubit>(context);
              if (state is PickImageSuccess) {
                await BlocProvider.of<UploudImageCubit>(context)
                    .uploadAndDowload(file: get.file!, baseName: get.baseName!);
              } else if (state is PickImageFailure) {
                customToastText(
                    toastMessage: 'failure pick image',
                    state: ToastStates.error);
              }
            },
            child: ElevatedButton(
                onPressed: () async {
                  await BlocProvider.of<PickImageCubit>(context).pickImage();
                  log('you are right ');
                  GoRouter.of(context).pop();
                },
                child: Text(
                  'pick image',
                  style: Styles.styleGrey14.copyWith(color: Colors.white),
                )),
          ),
          BlocListener<CapturePhotoCubit, CapturePhotoState>(
            listener: (context, state) async {
              var get = BlocProvider.of<PickImageCubit>(context);
              if (state is CapturePhotoSuccess) {
                await BlocProvider.of<UploudImageCubit>(context)
                    .uploadAndDowload(file: get.file!, baseName: get.baseName!);
              } else if (state is CapturePhotoFailure) {
                customToastText(
                    toastMessage: 'failure pick image',
                    state: ToastStates.error);
              }
            },
            child: ElevatedButton(
                onPressed: () async {
                  await BlocProvider.of<CapturePhotoCubit>(context)
                      .capturePhoto();
                  GoRouter.of(context).pop();
                },
                child: Text(
                  'capture photo',
                  style: Styles.styleGrey14.copyWith(color: Colors.white),
                )),
          ),
        ],
      ),
    ),
  );
}

/*customAlertDialog(BuildContext context) {
  return AlertDialog(
    elevation: 3,
    backgroundColor: AppColors.babyGreen,
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          ElevatedButton(
              onPressed: () async {
                await BlocProvider.of<PickImageCubit>(context).pickImage();
                log('you are right ');
                GoRouter.of(context).pop();
                //Navigator.of(context).pop();
                //Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'pick image',
                style: Styles.styleGrey14.copyWith(color: Colors.white),
              )),
          ElevatedButton(
              onPressed: () async {
                await BlocProvider.of<CapturePhotoCubit>(context)
                    .capturePhoto();
                GoRouter.of(context).pop();
                //Navigator.of(context).pop();
                //Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'capture photo',
                style: Styles.styleGrey14.copyWith(color: Colors.white),
              )),
        ],
      ),
    ),
  );
}*/
