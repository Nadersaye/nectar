import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_user_details_state.dart';

class AddUserDetailsCubit extends Cubit<AddUserDetailsState> {
  AddUserDetailsCubit() : super(AddUserDetailsInitial());
}
