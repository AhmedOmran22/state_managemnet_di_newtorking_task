import 'package:dartz/dartz.dart';

import 'package:state_managemnet_di_newtorking_task/core/errors/failure.dart';
import 'package:state_managemnet_di_newtorking_task/core/services/api_service.dart';

import 'package:state_managemnet_di_newtorking_task/features/products/data/models/product_model.dart';

import '../../../../core/constants/end_points.dart';
import '../../../../core/errors/exception.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ApiService apiService;

  ProductRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      List<ProductModel> products = [];
      final result = await apiService.get(
        EndPoints.products,
        data: {"page": 1, "pageSize": 10},
      );
      for (var element in result["items"]) {
        products.add(ProductModel.fromJson(element));
      }
      return Right(products);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavorite(String productId) async {
    await Future.delayed(const Duration(seconds: 2));
    return const Right(null);
  }
}
