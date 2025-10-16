import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/cubits/product_state.dart';
import '../../data/models/product_model.dart';
import '../../data/repos/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;

  ProductCubit(this.productRepo) : super(const ProductState());

  Future<void> getProducts() async {
    emit(state.copyWith(productsState: ProductsState.loading));
    // await Future.delayed(const Duration(seconds: 10));

    final result = await productRepo.getAllProducts();

    // if (state.products != null) {
    //   emit(
    //     state.copyWith(
    //       productsState: ProductsState.success,
    //       errMessage: result.fold(
    //         (failure) => failure.errMessage,
    //         (products) => null,
    //       ),
    //       products: state.products,
    //     ),
    //   );
    // }

    result.fold(
      (failure) => emit(
        state.copyWith(
          errMessage: failure.errMessage,
          productsState: ProductsState.failure,
        ),
      ),
      (products) => emit(
        state.copyWith(
          products: products,
          productsState: ProductsState.success,
        ),
      ),
    );
  }

  void toggleFavorite(String productId) async {
    final updatedProducts = List<ProductModel>.from(state.products ?? []);
    final index = updatedProducts.indexWhere((p) => p.id == productId);

    if (index == -1) return;
    final oldValue = updatedProducts[index].isFavorite;
    updatedProducts[index].isFavorite = !oldValue;
    emit(state.copyWith(products: updatedProducts));

    final result = await productRepo.toggleFavorite(productId);

    result.fold((failure) {
      updatedProducts[index].isFavorite = oldValue;
      emit(state.copyWith(products: updatedProducts));
    }, (_) {});
  }

  Future<void> pagination() async {
    // request API
    // emite(state.copyWith(products = state.products + response))
  }
}
