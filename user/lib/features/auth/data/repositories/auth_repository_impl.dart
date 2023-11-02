import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';

import '../../domain/repositories/auth_repository.dart';

import '../datasources/auth_remote_datasource.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImplement extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImplement({
    required this.authRemoteDataSource,
  });

  @override
  Future<Result<ResponseWrapper<LoginModel>>> login(
      Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = authRemoteDataSource.login(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<LoginModel>>> signUp(
      Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = authRemoteDataSource.signUp(params);
      return result;
    });
  }
}
