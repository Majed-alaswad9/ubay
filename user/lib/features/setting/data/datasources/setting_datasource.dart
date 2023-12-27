import 'package:dio/dio.dart';
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
import 'package:user/features/products/data/model/category_model/category_model.dart';
import 'package:user/features/setting/domain/usecase/change_password_use_case.dart';
import 'package:user/features/setting/domain/usecase/edit_profile_use_case.dart';
import 'package:http_parser/http_parser.dart' as mime;

@injectable
class SettingDataSource {
  final ClientApi clientApi;

  SettingDataSource(this.clientApi);

  Future<ResponseWrapper<UserModel>> getMe() {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.user.user, clientMethod: ClientMethod.get));

      return ResponseWrapper.fromJson(response.data, (json) {
        final result = UserModel.fromJson(response.data);
        GetIt.I<PrefsRepository>().setUser(result);
        return result;
      });
    });
  }

  Future<ResponseWrapper<UserModel>> editProfile(EditProfileParams params) {
    return throwAppException(() async {
      FormData formData = FormData.fromMap({
        'name': params.name,
        'email': params.email,
        'photo': params.photo != null
            ? MultipartFile.fromFileSync(params.photo!.path,
                contentType: mime.MediaType('image', 'jpeg'))
            : null
      });
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.user.user,
          clientMethod: ClientMethod.patch,
          data: formData));
      return ResponseWrapper.fromJson(response.data, (json) {
        user = UserModel.fromJson(response.data);
        GetIt.I<PrefsRepository>().setUser(user);
        return user;
      });
    });
  }

  Future<ResponseWrapper<LoginModel>> changePassword(
      ChangePasswordParams params) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.user.updateMyPassword,
          clientMethod: ClientMethod.patch,
          data: params.map));
      return ResponseWrapper.fromJson(response.data, (json) {
        final userModel = LoginModel.fromJson(response.data);
        final prefsRepository = GetIt.I<PrefsRepository>();
        prefsRepository
          ..setUser(userModel.user)
          ..setToken(userModel.token);
        user = prefsRepository.user!;
        return userModel;
      });
    });
  }

  Future<ResponseWrapper<CategoryModel>> getCities() {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.product.cities, clientMethod: ClientMethod.get));
      return ResponseWrapper.fromJson(response.data, (json) {
        return CategoryModel.fromJson(response.data);
      });
    });
  }
}
