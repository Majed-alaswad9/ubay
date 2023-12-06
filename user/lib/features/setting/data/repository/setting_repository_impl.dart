import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/setting/data/datasources/setting_datasource.dart';
import 'package:user/features/setting/domain/repository/setting_repository.dart';
import 'package:user/features/setting/domain/usecase/change_password_use_case.dart';
import 'package:user/features/setting/domain/usecase/edit_profile_use_case.dart';

@Injectable(as: SettingRepository)
class SettingRepositoryImplement extends SettingRepository {
  final SettingDataSource settingDataSource;

  SettingRepositoryImplement(this.settingDataSource);
  @override
  Future<Result<ResponseWrapper<UserModel>>> getMyProfile() {
    return toApiResult(() {
      final result = settingDataSource.getMe();
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<UserModel>>> editMyProfile(
      EditProfileParams params) {
    return toApiResult(() {
      final result = settingDataSource.editProfile(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<LoginModel>>> changePassword(
      ChangePasswordParams params) {
    return toApiResult(() {
      final result = settingDataSource.changePassword(params);
      return result;
    });
  }
}
