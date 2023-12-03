import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';

import '../../../../core/api/result.dart';

abstract class SettingRepository {
  Future<Result<ResponseWrapper<User>>> getMyProfile();
}
