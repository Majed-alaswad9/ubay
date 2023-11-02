import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';

import 'package:user/features/auth/data/model/login_model/login_model.dart';

abstract class AuthRepository {
  Future<Result<ResponseWrapper<LoginModel>>> login(
      Map<String, dynamic> params);
  Future<Result<ResponseWrapper<LoginModel>>> signUp(
      Map<String, dynamic> params);
}
