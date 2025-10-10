import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managemnet_di_newtorking_task/features/products/presentation/cubits/product_state.dart';
import '../../data/repos/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;

  ProductCubit(this.productRepo) : super(const ProductState());

  Future<void> getProducts() async {
    emit(state.copyWith(productsState: ProductsState.loading));

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
}
