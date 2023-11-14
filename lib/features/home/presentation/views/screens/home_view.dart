import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:nectar/features/home/presentation/manager/manage%20navigation%20cubit/manage_navigation_cubit.dart';
//simport 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //SolidController controller = SolidController();
    return BlocBuilder<ManageNavigationCubit, ManageNavigationState>(
      builder: (context, state) {
        var navCubit = ManageNavigationCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: navCubit.bottmScreen[navCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: navCubit.currentIndex,
                selectedItemColor: AppColors.oceanGreen,
                unselectedItemColor: AppColors.blackRussian,
                selectedLabelStyle: Styles.styleblackRussian12
                    .copyWith(color: AppColors.oceanGreen),
                unselectedLabelStyle: Styles.styleblackRussian12,
                onTap: (index) {
                  ManageNavigationCubit.get(context)
                      .manageNavigationHomeScreen(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.store_outlined), label: 'Shop'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.manage_search_outlined),
                      label: 'Explore'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline), label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined), label: 'person'),
                ]),
          ),
        );
      },
    );
  }
}
