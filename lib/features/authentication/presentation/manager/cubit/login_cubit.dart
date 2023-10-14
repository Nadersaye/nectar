import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  void changePasswordVisabilty() {
    isPassword = !isPassword;
    emit(ChangePasswordVizabilityState());
  }

  bool isChecked = false;
  void changeCheckBox() {
    isChecked = !isChecked;
    emit(ChangePasswordVizabilityState());
  }
}
