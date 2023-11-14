import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'explore_categories_products_state.dart';

class ExploreCategoriesProductsCubit
    extends Cubit<ExploreCategoriesProductsState> {
  ExploreCategoriesProductsCubit() : super(ExploreCategoriesProductsInitial());
}
