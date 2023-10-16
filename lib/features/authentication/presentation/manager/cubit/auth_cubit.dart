import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  bool isChecked = false;
  void changePasswordVisabilty() {
    isPassword = !isPassword;
    emit(ChangePasswordVizabilityState());
  }

  void changeCheckBox() {
    isChecked = !isChecked;
    emit(ChangePasswordVizabilityState());
  }

  /*IconData changeVisibilityIcon() {
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    changePasswordVisabilty();
  }*/
}
