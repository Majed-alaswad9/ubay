import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';

import '../../../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase
    extends UseCase<Result<ResponseWrapper<LoginModel>>, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Result<ResponseWrapper<LoginModel>>> call(LoginParams params) async {
    return authRepository.login(params.map);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);

  Map<String, dynamic> get map => {
        "email": email,
        "password": password,
      };
}
