import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import 'custom_appbar_icon.dart';
import '../../../../../../core/widgets/custom_product_title_subtitle.dart';

class ProductDetailsContent extends StatefulWidget {
  const ProductDetailsContent({super.key, required this.product});
  final ProductItemModel product;
  @override
  State<ProductDetailsContent> createState() => _ProductDetailsContentState();
}

class _ProductDetailsContentState extends State<ProductDetailsContent> {
  bool changedIcon = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomProductTitleAndSubtitle(
          title: widget.product.title,
          subTitle: widget.product.subtitle,
        ),
        CustomIcon(
          onPressed: () {
            setState(() {
              changedIcon = !changedIcon;
            });
          },
          icon: Icon(
            changeIcon(changedIcon),
            size: 25.r,
          ),
          iconColor: changeIconColor(),
        )
      ],
    );
  }

  IconData changeIcon(bool changedIcon) {
    return changedIcon ? Icons.favorite : Icons.favorite_border_outlined;
  }

  Color changeIconColor() {
    return changedIcon ? Colors.red : AppColors.grey;
  }
}
