import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_dot_indicator.dart';
import '../../../../../../core/widgets/custom_page_view.dart';

class TogglingProductImages extends StatefulWidget {
  const TogglingProductImages(
      {super.key, required this.pageController, required this.items});
  final PageController pageController;
  final List<String> items;

  @override
  State<TogglingProductImages> createState() => _TogglingProductImagesState();
}

class _TogglingProductImagesState extends State<TogglingProductImages> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.honeydew,
        borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(25), bottomStart: Radius.circular(25)),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CustomPageView(
              items: widget.items,
              pageController: widget.pageController,
            ),
          ),
          Positioned(
              bottom: 30,
              right: MediaQuery.of(context).size.width / 2 - 30,
              child: CustomDotIndicator(
                pageController: widget.pageController,
                items: widget.items,
                currentIndex: currentIndex,
              ))
        ],
      ),
    );
  }
}
