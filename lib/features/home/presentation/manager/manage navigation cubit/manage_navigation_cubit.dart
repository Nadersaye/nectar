import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/features/home/presentation/views/screens/account_view.dart';
import 'package:nectar/features/home/presentation/views/screens/cart_view.dart';
import 'package:nectar/features/home/presentation/views/screens/explore_products_view.dart';
import 'package:nectar/features/home/presentation/views/screens/favourite_products_view.dart';
import 'package:nectar/features/home/presentation/views/screens/shop_view.dart';
part 'manage_navigation_state.dart';

class ManageNavigationCubit extends Cubit<ManageNavigationState> {
  ManageNavigationCubit() : super(ManageNavigationInitial());
  static ManageNavigationCubit get(context) => BlocProvider.of(context);

  List<Widget> bottmScreen = [
    const ShopView(),
    const ExploreProductsView(),
    const CartView(),
    const FavouriteProductsView(),
    const AccountView()
  ];
  int currentIndex = 0;
  void manageNavigationHomeScreen(int index) {
    currentIndex = index;
    emit(ManageNavigationChange());
  }
}
