import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import 'account_view.dart';
import 'favourite_products_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //TextEditingController searchController = TextEditingController();
    SolidController controller = SolidController();
    return SafeArea(
      child: Scaffold(
        body: const AccountView()
        /*ShopView(
          searchController: searchController,
        )*/
        ,
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.oceanGreen,
            unselectedItemColor: AppColors.blackRussian,
            selectedLabelStyle: Styles.styleblackRussian12
                .copyWith(color: AppColors.oceanGreen),
            unselectedLabelStyle: Styles.styleblackRussian12,
            onTap: (index) {},
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.store_outlined), label: 'Shop'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.manage_search_outlined), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'person'),
            ]),
      ),
    );
  }
}
