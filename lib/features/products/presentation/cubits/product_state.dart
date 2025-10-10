import 'package:state_managemnet_di_newtorking_task/features/products/data/models/product_model.dart';

enum ProductsState { initial, loading, success, failure }

class ProductState {
  final List<ProductModel>? products;
  final String? errMessage;
  final ProductsState productsState;

  const ProductState({
    this.products,
    this.errMessage,
    this.productsState = ProductsState.initial,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    String? errMessage,
    ProductsState? productsState,
  }) {
    return ProductState(
      products: products ?? this.products,
      errMessage: errMessage ?? this.errMessage,
      productsState: productsState ?? this.productsState,
    );
  }
}
