import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'nectar store',
            channelDescription: 'store app for groceries products')
      ],
      debug: true);
  runApp(const NectarApp());
}

class NectarApp extends StatefulWidget {
  const NectarApp({super.key});

  @override
  State<NectarApp> createState() => _NectarAppState();
}

class _NectarAppState extends State<NectarApp> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

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