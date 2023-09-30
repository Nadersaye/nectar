import 'package:flutter/material.dart';
import '../widgets/product details widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductDetailsBody(),
    );
  }
}
