import 'package:animated_digit/animated_digit.dart';

class CartItemModel {
  late double price;
  late double offerPrice;
  late String image;
  late String title;
  late String subTitle;
  late AnimatedDigitController countController;
  late AnimatedDigitController priceController;
  late bool isOfferProduct;
  CartItemModel(
      this.price,
      this.offerPrice,
      this.image,
      this.title,
      this.subTitle,
      this.isOfferProduct,
      this.countController,
      this.priceController);
}
