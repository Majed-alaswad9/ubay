import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/auth/domain/repositories/auth_repository.dart';

@injectable
class SignUpUseCase
    implements UseCase<Result<ResponseWrapper<LoginModel>>, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);
  @override
  Future<Result<ResponseWrapper<LoginModel>>> call(SignUpParams params) async {
    return authRepository.signUp(params.map);
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpParams(this.name, this.email, this.password, this.confirmPassword);

  Map<String, dynamic> get map => {
        "name": name,
        "email": email,
        'password': password,
        'confirmPassword': confirmPassword
      };
}
