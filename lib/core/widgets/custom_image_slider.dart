import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/utils/constants.dart';

// ignore: must_be_immutable
class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider(
      {super.key,
      required this.items,
      required this.aspectRactio,
      required this.height,
      required this.autoNavigate});
  final List<String> items;
  final double aspectRactio;
  final double height;
  final bool autoNavigate;
  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: widget.items.map((e) => Image(image: AssetImage(e))).toList(),
        options: CarouselOptions(
            height: widget.height,
            aspectRatio: widget.aspectRactio,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: widget.autoNavigate,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (value, reason) {
              changeCurrentIndexValue(value);
            },
            scrollDirection: Axis.horizontal,
            scrollPhysics: const BouncingScrollPhysics()));
  }

  void changeCurrentIndexValue(int value) {
    setState(() {
      currentIndex = value;
    });
  }
}
