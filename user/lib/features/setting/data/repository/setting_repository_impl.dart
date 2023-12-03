import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/setting/domain/repository/setting_repository.dart';

@Injectable(as: SettingRepository)
class SettingRepositoryImplement extends SettingRepository {
  @override
  Future<Result<ResponseWrapper<User>>> getMyProfile() {
    // TODO: implement getMyProfile
    throw UnimplementedError();
  }
}
