import 'package:flutter/material.dart';
import 'package:nectar/core/widgets/custom_textformfield.dart';
import '../widgets/shop widgets/shop_view_appbar.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key, required this.searchController});
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
            child: ShopViewAppBar(
          location: '',
        )),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomTextFormField(
              searchController: searchController, onChanged: (value) {}),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
      ],
    );
  }
}
