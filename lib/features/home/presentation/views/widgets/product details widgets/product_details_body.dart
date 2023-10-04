import 'package:animated_digit/animated_digit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import 'package:nectar/features/home/presentation/views/widgets/product%20details%20widgets/toggling_product_image.dart';
import '../../../../../../core/widgets/increase_decrease_product_count.dart';
import 'product_details_appbar.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key});

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  late AnimatedDigitController countController = AnimatedDigitController(1);
  late AnimatedDigitController priceController = AnimatedDigitController(price);
  final PageController pageController = PageController(initialPage: 0);
  late CarouselController carouselController;
  static const double price = 4.99;
  bool isOfferProduct = false;
  double offerPrice = 3.2;
  int currentIndex = 0;
  bool changedIcon = false;
  List<String> items = [
    'assets/images/apple.png',
    'assets/images/apple2.png',
    'assets/images/apple3.png'
  ];
  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  @override
  void dispose() {
    countController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const ProductDetailsAppbar(),
        TogglingProductImages(
          items: items,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                IncreaseAndDecreaseProductCount(
                  countController: countController,
                  priceController: priceController,
                  price: price,
                  isOfferProduct: isOfferProduct,
                  offerPrice: offerPrice,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: AppColors.lightGray))),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: Text(
                      'Product Detail',
                      style: Styles.styleBlackRussian18,
                    ),
                    children: [
                      Text(
                        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                        style: Styles.styleGrey13,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: AppColors.lightGray))),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: Text(
                      'Nutritions',
                      style: Styles.styleBlackRussian18,
                    ),
                    children: [
                      Text(
                        'Calories: 94.6 , Water: 156 grams , Protein: 0.43 grams , Carbs: 25.1 grams , Sugar: 18.9 grams , Fiber: 4.37 grams , Fat: 0.3 grams',
                        style: Styles.styleGrey13,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: AppColors.lightGray))),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    trailing: RatingBar.builder(
                      ignoreGestures: true,
                      maxRating: 5,
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15.0,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: AppColors.orange,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    title: Text(
                      'Review',
                      style: Styles.styleBlackRussian18,
                    ),
                    children: [
                      Text(
                        'Calories: 94.6 , Water: 156 grams , Protein: 0.43 grams , Carbs: 25.1 grams , Sugar: 18.9 grams , Fiber: 4.37 grams , Fat: 0.3 grams',
                        style: Styles.styleGrey13,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomActionButton(
                  buttonText: 'Add To Basket',
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
