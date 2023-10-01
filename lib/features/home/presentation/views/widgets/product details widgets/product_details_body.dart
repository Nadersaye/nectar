import 'package:animated_digit/animated_digit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import 'package:nectar/features/home/presentation/views/widgets/product%20details%20widgets/custom_appbar_icon.dart';
import 'package:nectar/features/home/presentation/views/widgets/product%20details%20widgets/toggling_product_image.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
              width: double.infinity,
              height: 60,
              color: AppColors.honeydew,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIcon(
                    icon: const Icon(
                      FontAwesomeIcons.angleLeft,
                      color: AppColors.blackRussian,
                    ),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                  CustomIcon(
                    icon: const Icon(
                      FontAwesomeIcons.arrowUpFromBracket,
                      color: AppColors.blackRussian,
                    ),
                  ),
                ],
              )),
        ),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomIcon(
                      icon: const Icon(Icons.remove),
                      size: 23.r,
                      onPressed: () {
                        if (countController.value != 0) {
                          countController.minusValue(1);
                          priceController.minusValue(price);
                        }
                      },
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGray),
                          borderRadius: BorderRadius.circular(17.r)),
                      child: Center(
                        child: AnimatedDigitWidget(
                          controller: countController,
                          textStyle: Styles.styleBlackRussian18,
                          enableSeparator: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CustomIcon(
                      icon: Icon(
                        Icons.add,
                        color: AppColors.oceanGreen,
                        size: 23.w,
                      ),
                      onPressed: () {
                        countController.addValue(1);
                        priceController.addValue(price);
                      },
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Price : ',
                                style: Styles.styleBlackRussian18.copyWith(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: r'$' '$price',
                                style: Styles.styleBlackRussian18)
                          ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Total : ',
                              style: Styles.styleBlackRussian18.copyWith(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            AnimatedDigitWidget(
                              controller: priceController,
                              textStyle: Styles.styleBlackRussian18,
                              fractionDigits: 2,
                              enableSeparator: true,
                              prefix: '\$',
                            ),
                          ],
                        )
                      ],
                    )
                  ],
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
