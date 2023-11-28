import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import 'product_details_body.dart';

class CustomReviewTile extends StatelessWidget {
  const CustomReviewTile({
    super.key,
    required this.widget,
  });

  final ProductDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: AppColors.lightGray))),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        trailing: RatingBar.builder(
          ignoreGestures: true,
          maxRating: 5,
          initialRating: widget.product.rate as double,
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
            'you can rate our product',
            style: Styles.styleGrey13,
          ),
        ],
      ),
    );
  }
}
