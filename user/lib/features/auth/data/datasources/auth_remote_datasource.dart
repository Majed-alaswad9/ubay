import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/client.dart';
import 'package:user/core/api/client_config.dart';
import 'package:user/core/common/constants/configuration/uri_routs.dart';
import 'package:user/core/common/constants/constants.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/app/domain/repository/prefs_repository.dart';

import 'package:user/features/auth/data/model/login_model/login_model.dart';

@injectable
class AuthRemoteDataSource {
  final ClientApi clientApi;

  AuthRemoteDataSource({required this.clientApi});
  Future<ResponseWrapper<LoginModel>> login(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.auth.login,
          clientMethod: ClientMethod.post,
          data: params));

      return ResponseWrapper.fromJson(response.data, (json) {
        final userModel = LoginModel.fromJson(response.data);
        final PrefsRepository prefsRepository = GetIt.I<PrefsRepository>();
        prefsRepository
          ..setToken(userModel.token)
          ..setUser(userModel.user);
        user = prefsRepository.user!;
        return userModel;
      });
    });
  }

  Future<ResponseWrapper<LoginModel>> signUp(
      Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.auth.signup,
          clientMethod: ClientMethod.post,
          data: params));
      return ResponseWrapper.fromJson(response.data, (json) {
        final userModel = LoginModel.fromJson(json);
        final PrefsRepository prefsRepository = GetIt.I<PrefsRepository>();
        prefsRepository
          ..setToken(userModel.token)
          ..setUser(userModel.user);
        user = prefsRepository.user!;
        return userModel;
      });
    });
  }
}
