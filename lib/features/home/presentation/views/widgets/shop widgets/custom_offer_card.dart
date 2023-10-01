import 'package:flutter/material.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 173.325,
        height: 248.51,
        decoration: BoxDecoration(
          border: Border.all(
            color: 
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
                color: Color(0x00000000),
                offset: Offset(0, 6),
                blurRadius: 12,
                )
          ],
        ));
  }
}
