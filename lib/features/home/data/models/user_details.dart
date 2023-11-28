class UserDetailsModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String photo;
  final String customerId;
  final String token;

  UserDetailsModel(
      {this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.photo,
      required this.customerId,
      required this.token});
}
