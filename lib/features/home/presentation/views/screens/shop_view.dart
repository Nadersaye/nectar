import 'package:flutter/material.dart';
import '../widgets/shop widgets/shop_view_appbar.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: ShopViewAppBar(
          location: '',
        )),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        )
      ],
    );
  }
}
