import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_request_model.dart';
import '../../data/repos/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._authRepo) : super(LoginInitial());

  final AuthRepo _authRepo;

  void login({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoading());
    final result = await _authRepo.login(loginRequestModel: loginRequestModel);
    result.fold((failure) {
      emit(LoginFailure(errMessage: failure.errMessage));
    }, (r) => emit(LoginSuccess()));
  }
}
