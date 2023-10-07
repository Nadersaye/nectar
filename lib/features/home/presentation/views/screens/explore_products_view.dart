import 'package:flutter/material.dart';
import '../widgets/explore products widgets/explore_products_view_body.dart';

class ExploreProductsView extends StatefulWidget {
  const ExploreProductsView({super.key});

  @override
  State<ExploreProductsView> createState() => _ExploreProductsViewState();
}

class _ExploreProductsViewState extends State<ExploreProductsView> {
  late TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return ExploreProductsViewBody(
      searchController: searchController,
    );
  }
}
