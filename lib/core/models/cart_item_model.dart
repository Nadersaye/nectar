class CartItemModel {
  late double price;
  late double offerPrice;
  late String image;
  late String title;
  late String subTitle;
  late num countController;
  late num totalPriceController;
  late bool isOfferProduct;
  CartItemModel(
      this.price,
      this.offerPrice,
      this.image,
      this.title,
      this.subTitle,
      this.isOfferProduct,
      this.countController,
      this.totalPriceController);
}
