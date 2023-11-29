import 'package:dartz/dartz.dart';
import 'package:nectar/features/profile/data/models/user%20details%20model/user_details.dart';

abstract class AccountRepo {
  addUserDetails();
  Future<Either<String, UserDetailsModel>> fetchUserDetails();
  updateUserDetails();
}
