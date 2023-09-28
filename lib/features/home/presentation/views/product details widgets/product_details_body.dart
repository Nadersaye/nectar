import 'package:animated_digit/animated_digit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import 'package:nectar/features/home/presentation/views/product%20details%20widgets/custom_appbar_icon.dart';

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
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.honeydew,
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(25),
                bottomStart: Radius.circular(25)),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    itemCount: items.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Image.asset(
                          items[index],
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      );
                    }),
              ),
              Positioned(
                  bottom: 30,
                  right: MediaQuery.of(context).size.width / 2 - 30,
                  child: DotsIndicator(
                    dotsCount: items.length,
                    position: currentIndex,
                    decorator: DotsDecorator(
                      size: const Size.square(6.0),
                      activeSize: const Size(16.0, 6.0),
                      activeColor: AppColors.oceanGreen,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                    ),
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            'Naturel Red Apple',
                            style: Styles.style18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '1 kg, price',
                          style: Styles.style16.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                    CustomIcon(
                      onPressed: () {
                        setState(() {
                          changedIcon = !changedIcon;
                        });
                      },
                      icon: Icon(
                        changedIcon
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 25.r,
                      ),
                      iconColor: changedIcon ? Colors.red : AppColors.grey,
                    )
                  ],
                ),
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
                          textStyle: Styles.style18,
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
                                style: Styles.style18.copyWith(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(text: r'$' '$price', style: Styles.style18)
                          ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Total : ',
                              style: Styles.style18.copyWith(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            AnimatedDigitWidget(
                              controller: priceController,
                              textStyle: Styles.style18,
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
                      style: Styles.style18,
                    ),
                    children: [
                      Text(
                        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                        style: Styles.style13,
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
                      style: Styles.style18,
                    ),
                    children: [
                      Text(
                        'Calories: 94.6 , Water: 156 grams , Protein: 0.43 grams , Carbs: 25.1 grams , Sugar: 18.9 grams , Fiber: 4.37 grams , Fat: 0.3 grams',
                        style: Styles.style13,
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
                      style: Styles.style18,
                    ),
                    children: [
                      Text(
                        'Calories: 94.6 , Water: 156 grams , Protein: 0.43 grams , Carbs: 25.1 grams , Sugar: 18.9 grams , Fiber: 4.37 grams , Fat: 0.3 grams',
                        style: Styles.style13,
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
