import 'package:dartz/dartz.dart';
import 'package:state_managemnet_di_newtorking_task/core/constants/constants.dart';
import 'package:state_managemnet_di_newtorking_task/core/services/prefs.dart';
import '../../../../core/constants/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    try {
      final result = await apiService.post(
        EndPoints.login,
        data: loginRequestModel.toJson(),
      );
      final LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        result,
      );
      Prefs.setString(kAccessToken, loginResponseModel.accessToken);
      Prefs.setString(kRefreshToken, loginResponseModel.refreshToken);
      return Right(loginResponseModel);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }
}
