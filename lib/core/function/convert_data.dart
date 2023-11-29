import 'package:nectar/core/models/cart_item_model.dart';
import 'package:nectar/core/models/product_item_model.dart';

ProductItemModel convertToProduct(CartItemModel cart) {
  return ProductItemModel(
      title: cart.title,
      subtitle: cart.subTitle,
      type: '',
      category: '',
      company: '',
      imageUrl: '',
      rate: 5,
      benefits: '',
      details: '',
      price: cart.price,
      offerPrice: cart.offerPrice);
}
