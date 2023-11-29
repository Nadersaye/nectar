import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageRepo {
  Future<Either<String, XFile>> pickImage();
  Future<Either<String, XFile>> capturePhoto();
}
