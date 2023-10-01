import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/utils/constants.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView(
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
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
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
              setState(() {
                currentIndex = value;
              });
            },
            scrollDirection: Axis.horizontal,
            scrollPhysics: const BouncingScrollPhysics()));
  }
}
