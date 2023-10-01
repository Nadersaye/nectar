import 'package:flutter/material.dart';
import 'package:nectar/core/widgets/custom_image_slider.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_dot_indicator.dart';

class TogglingProductImages extends StatefulWidget {
  const TogglingProductImages({super.key, required this.items});
  final List<String> items;

  @override
  State<TogglingProductImages> createState() => _TogglingProductImagesState();
}

class _TogglingProductImagesState extends State<TogglingProductImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
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
            child: CustomImageSlider(
              items: widget.items,
              aspectRactio: 3.3 / 2,
              height: 200,
              autoNavigate: false,
            ),
          ),
          Positioned(
              bottom: 30,
              right: MediaQuery.of(context).size.width / 2 - 30,
              child: CustomDotIndicator(
                items: widget.items,
              ))
        ],
      ),
    );
  }
}
