import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_cubit.dart';
import '../cubits/product_state.dart';
import 'product_item_widget.dart';

class ProductsListViewBlocBuilder extends StatelessWidget {
  const ProductsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        switch (state.productsState) {
          case ProductsState.loading:
            return const Center(child: CircularProgressIndicator());
          case ProductsState.failure:
            return Center(
              child: Text(state.errMessage ?? 'Something went wrong'),
            );
          case ProductsState.success:
            if (state.products!.isEmpty) {
              return const Center(child: Text('No products found'));
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.products!.length,
              itemBuilder: (context, index) {
                final product = state.products![index];
                return ProductItem(product: product);
              },
            );
          case ProductsState.initial:
            return const Center(
              child: Text('Press the button to load products'),
            );
        }
      },
    );
  }
}
