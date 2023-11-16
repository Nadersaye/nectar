import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/stripe%20payment/stripe_keys.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:nectar/features/home/presentation/manager/manage%20navigation%20cubit/manage_navigation_cubit.dart';
import 'features/home/presentation/manager/manage favourite cubit/manage_favourite_cubit.dart';
import 'features/home/presentation/manager/toggle images cubit/toggle_images_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBNoqNV2Bp3ZmrEz_N81xq4jpQP7POH5hg",
              appId: "1:239642353975:android:0db659028a2eeb9419bab2",
              messagingSenderId: "239642353975",
              projectId: "nectar-1ff4d",
              storageBucket: "nectar-1ff4d.appspot.com"))
      : await Firebase.initializeApp();
  Stripe.publishableKey = StripeKeys.publishablekey;
  Stripe.merchantIdentifier = 'string';
  await Stripe.instance.applySettings();
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ManageNavigationCubit(),
          ),
          BlocProvider(
            create: (context) => ToggleImagesCubit(),
          ),
          BlocProvider(
            create: (context) => ManageFavouriteCubit(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRoutes.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: AppColors.oceanGreen, fontFamily: 'Gilroy'),
        ),
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