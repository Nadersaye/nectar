import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/widgets/custom_image_slider.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_dot_indicator.dart';

class ToggolingOffersImage extends StatefulWidget {
  const ToggolingOffersImage(
      {super.key,
      required this.items,
      required this.fitImage,
      required this.spaceBottom});
  final List<String> items;
  final BoxFit fitImage;
  final double spaceBottom;
  @override
  State<ToggolingOffersImage> createState() => _ToggolingOffersImageState();
}

class _ToggolingOffersImageState extends State<ToggolingOffersImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.5),
      child: Container(
        height: 115,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.honeydew,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CustomImageSlider(
                items: widget.items,
                aspectRactio: 367 / 115,
                height: double.infinity,
                autoNavigate: true,
                fitImage: widget.fitImage,
              ),
            ),
            Positioned(
                bottom: widget.spaceBottom,
                left: MediaQuery.of(context).size.width / 2 -
                    (widget.items.length * 18),
                child: CustomDotIndicator(
                  items: widget.items,
                ))
          ],
        ),
      ),
    );
  }
}
