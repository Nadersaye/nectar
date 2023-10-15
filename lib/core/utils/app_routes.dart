import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/features/home/presentation/views/screens/product_details_view.dart';
import '../../features/authentication/presentation/views/screens/login_view.dart';
import '../../features/home/presentation/views/screens/cart_view.dart';
import '../../features/home/presentation/views/screens/explore_products_view.dart';
import '../../features/home/presentation/views/screens/home_view.dart';
import '../../features/onBoarding/presentation/view/screens/onboarding_view.dart';
import '../../features/show products/presentation/views/show_products_view.dart';
import '../../features/splash/presentation/views/screens/splash_view.dart';

abstract class AppRoutes {
  static const String homeView = '/homeView';
  static const String productDetailsView = '/ProductDetailsView';
  static const String searchView = '/SearchView';
  static const String cartView = '/CartView';
  static const String exploreProductsView = '/ExploreProductsView';
  static const String showProductsView = '/ShowProductsView';
  static const String onboardingView = '/OnboardingView';
  static const String loginView = '/LoginView';

  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: productDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return const ProductDetailsView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: cartView,
        builder: (BuildContext context, GoRouterState state) {
          return const CartView();
        },
      ),
      GoRoute(
        path: exploreProductsView,
        builder: (BuildContext context, GoRouterState state) {
          return const ExploreProductsView();
        },
      ),
      GoRoute(
        path: showProductsView,
        builder: (BuildContext context, GoRouterState state) {
          return const ShowProductsView(
              /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/);
        },
      ),
      GoRoute(
        path: onboardingView,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingView(
              /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/);
        },
      ),
      GoRoute(
        path: loginView,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView(
              /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/);
        },
      ),
      //OnboardingView
    ],
  );
}
