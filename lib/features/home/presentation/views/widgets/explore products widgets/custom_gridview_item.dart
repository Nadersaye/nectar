import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/colors.dart';

import 'gridview_item_body.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});
  final 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.columbiaBlue,
          borderRadius: BorderRadius.all(Radius.circular(18.r)),
          border: Border.all(color: AppColors.oceanGreen)),
      child: const GridviewItemBody(categoryItem: null,),
    );
  }
}
