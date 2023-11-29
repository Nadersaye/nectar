import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/features/profile/data/repos/image%20repo/image_repo.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit(this.imageRepo) : super(PickImageInitial());
  final ImageRepo imageRepo;
  File? file;
  String? baseName;
  pickImage() async {
    var responce = await imageRepo.pickImage();
    responce.fold((error) {
      emit(PickImageFailure(errorMessage: error));
    }, (image) {
      file = File(image.path);
      baseName = p.basename(image.path);
      emit(PickImageSuccess());
    });
  }
}
