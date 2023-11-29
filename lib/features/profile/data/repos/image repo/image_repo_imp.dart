import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'image_repo.dart';

class ImageRepoImp implements ImageRepo {
  final ImagePicker picker = ImagePicker();
  @override
  Future<Either<String, XFile>> capturePhoto() async {
    try {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        return right(photo);
      } else {
        return left('you closed image picker before capture any photo');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, XFile>> pickImage() async {
    try {
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        return right(image);
      } else {
        return left('you closed image picker before pick any image');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
