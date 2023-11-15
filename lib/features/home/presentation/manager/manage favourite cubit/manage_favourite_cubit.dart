import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/colors.dart';
part 'manage_favourite_state.dart';

class ManageFavouriteCubit extends Cubit<ManageFavouriteState> {
  ManageFavouriteCubit() : super(ManageFavouriteInitial());
  static ManageFavouriteCubit get(context) => BlocProvider.of(context);
  IconData? icon;
  Color? color;
  bool changedIcon = false;
  manageIconAndColor() {
    icon = changeIcon();
    color = changeIconColor();
  }

  changeFavourite() {
    changedIcon = !changedIcon;
    emit(ManageFavouriteChanged());
  }

  IconData changeIcon() {
    return changedIcon ? Icons.favorite : Icons.favorite_border_outlined;
  }

  Color changeIconColor() {
    return changedIcon ? Colors.red : AppColors.grey;
  }
}
