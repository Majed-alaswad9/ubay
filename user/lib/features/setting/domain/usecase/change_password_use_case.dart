import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/setting/domain/repository/setting_repository.dart';

@injectable
class ChangePasswordUseCase
    extends UseCase<Result<ResponseWrapper<LoginModel>>, ChangePasswordParams> {
  final SettingRepository settingRepository;

  ChangePasswordUseCase(this.settingRepository);
  @override
  Future<Result<ResponseWrapper<LoginModel>>> call(
      ChangePasswordParams params) async {
    return settingRepository.changePassword(params);
  }
}

class ChangePasswordParams {
  final String currentPassword;
  final String password;

  ChangePasswordParams(this.currentPassword, this.password);

  Map<String, dynamic> get map =>
      {'passwordCurrent': currentPassword, 'password': password};
}
