import 'package:state_managemnet_di_newtorking_task/features/auth/data/models/login_request_model.dart';

import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../models/login_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestModel loginRequestModel,
  });
}
