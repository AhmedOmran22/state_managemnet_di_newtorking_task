import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_cubit.dart';
import '../cubits/product_state.dart';

class FavouriteIconWidget extends StatelessWidget {
  final String productId;
  const FavouriteIconWidget({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProductCubit, ProductState, bool>(
      selector: (state) {
        final product = state.products?.firstWhere(
          (product) => product.id == productId,
        );
        return product!.isFavorite;
      },
      builder: (context, isFavorite) {
        return IconButton(
          onPressed: () {
            context.read<ProductCubit>().toggleFavorite(productId);
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
