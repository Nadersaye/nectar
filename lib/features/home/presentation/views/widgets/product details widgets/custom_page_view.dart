import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView(
      {super.key, required this.pageController, required this.items});
  final PageController pageController;
  final List<String> items;
  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: widget.pageController,
        itemCount: widget.items.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Image.asset(
              widget.items[index],
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
          );
        });
  }
}
