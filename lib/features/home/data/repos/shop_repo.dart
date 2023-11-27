import 'package:nectar/core/models/product_item_model.dart';
import 'package:dartz/dartz.dart';

abstract class ShopRepo {
  Future<Either<String, List<ProductItemModel>>> fetchBestSellerProducts();
  Future<Either<String, List<ProductItemModel>>> fetchExclusiveOfferProducts();
  //Future<List<ProductItemModel>> fetchSimilarBooks();
}
