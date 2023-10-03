import 'package:flutter/material.dart';
import 'package:nectar/features/home/presentation/views/widgets/shop%20widgets/custom_offer_card.dart';

class OfferListView extends StatelessWidget {
  const OfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding:
            const EdgeInsetsDirectional.only(start: 25, top: 10, bottom: 10),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsetsDirectional.only(end: 15),
            child: CustomOfferCard(),
          );
        },
      ),
    );
  }
}
