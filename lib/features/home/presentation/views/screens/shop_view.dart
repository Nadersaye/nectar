import 'package:flutter/material.dart';
import 'package:nectar/core/widgets/custom_textformfield.dart';
import '../widgets/shop widgets/custom_exclusive_offer.dart';
import '../widgets/shop widgets/shop_product_list_view.dart';
import '../widgets/shop widgets/shop_view_appbar.dart';
import '../widgets/shop widgets/toggling_offers_imgae.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'assets/images/adv1.jpg',
      'assets/images/adv2.jpg',
      'assets/images/adv4.jpg',
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
              child: ShopViewAppBar(
            location: 'fayoum ,sanhour',
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: CustomTextFormField(
                  searchController: searchController, onChanged: (value) {}),
            ),
          ),
          SliverToBoxAdapter(
            child: ToggolingOffersImage(
              items: items,
              fitImage: BoxFit.fill,
              spaceBottom: 9,
            ),
          ),
          const SliverToBoxAdapter(
              child: ProductTitleRow(
            title: 'Exclusive Offer',
          )),
          const SliverToBoxAdapter(
            child: ProductsListView(
              isOffer: true,
            ),
          ),
          const SliverToBoxAdapter(
              child: ProductTitleRow(
            title: 'Best Selling',
          )),
          const SliverToBoxAdapter(
            child: ProductsListView(
              isOffer: false,
            ),
          ),
          const SliverToBoxAdapter(
              child: ProductTitleRow(
            title: 'Groceries',
          )),
        ],
      ),
    );
  }
}
