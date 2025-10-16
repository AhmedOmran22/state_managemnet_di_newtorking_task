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

  void toggleFavorite(String productId) {
    final updatedProducts = List<ProductModel>.from(state.products ?? []);
    final index = updatedProducts.indexWhere((p) => p.id == productId);
    // request to add favourite to the api
    if (index != -1) {
      updatedProducts[index].isFavorite = !updatedProducts[index].isFavorite;
      emit(state.copyWith(products: updatedProducts));
    }
  }

  // add products to favorites
  //? request to add favorite
  //!  emit (// state.procusts.indexWhere(id = id) => !isFavourite)
}
