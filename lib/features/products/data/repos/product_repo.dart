import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, void>> toggleFavorite(String productId);
}
