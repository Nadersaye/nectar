import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/stripe%20payment/stripe_keys.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:nectar/features/authentication/presentation/manager/cubit/auth_cubit.dart';
import 'package:nectar/features/home/presentation/manager/manage%20navigation%20cubit/manage_navigation_cubit.dart';
import 'features/home/presentation/manager/manage favourite cubit/manage_favourite_cubit.dart';
import 'features/home/presentation/manager/toggle images cubit/toggle_images_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
            create: (context) => LoginCubit(),
          ),
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