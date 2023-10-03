import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/core/utils/colors.dart';

void main() {
  runApp(const NectarApp());
}

class NectarApp extends StatelessWidget {
  const NectarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primaryColor: AppColors.oceanGreen, fontFamily: 'Gilroy'),
      ),
    );
  }
}
//Grap & Go
//Handcrafted by Gournet #
//Meat,Poultry$ Seafood 
//Bakery
//Dairy &Eggs
//Deli
//Fruits $ vegetables
//Platters&boxes #
//Health & Beauty
//Baby
//Food Cupboard
//Desserts & Snacks
//Household
//Freezer
//Pet
//Kitchen, Dinning&Home
//Cooking Oil& Ghee