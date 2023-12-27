import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/products/data/model/category_model/category_model.dart';
import 'package:user/features/setting/domain/usecase/change_password_use_case.dart';
import 'package:user/features/setting/domain/usecase/edit_profile_use_case.dart';

import '../../../../core/api/result.dart';

abstract class SettingRepository {
  Future<Result<ResponseWrapper<UserModel>>> getMyProfile();
  Future<Result<ResponseWrapper<UserModel>>> editMyProfile(
      EditProfileParams params);
  Future<Result<ResponseWrapper<LoginModel>>> changePassword(
      ChangePasswordParams params);
  Future<Result<ResponseWrapper<CategoryModel>>> getCities();
}
