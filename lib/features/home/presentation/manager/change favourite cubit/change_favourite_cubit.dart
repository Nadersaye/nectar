import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/constants.dart';

part 'change_favourite_state.dart';

class ChangeFavouriteCubit extends Cubit<ChangeFavouriteState> {
  ChangeFavouriteCubit() : super(ChangeFavouriteInitial());

  String? mainPath;
  bool? favourite;
  updateFavourite() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection(productCollection);
    try {
      emit(ChangeFavouriteLoading());
      await products.doc(mainPath).update({"favourite": favourite});
      emit(ChangeFavouriteSuccess());
    } catch (e) {
      emit(ChangeFavouriteFailure(errorMessage: e.toString()));
    }
  }
}
