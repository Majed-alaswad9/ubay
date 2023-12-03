import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/setting/domain/repository/setting_repository.dart';

@injectable
class GetNeUseCase extends UseCase<Result<ResponseWrapper<User>>, NoParams> {
  final SettingRepository settingRepository;

  GetNeUseCase(this.settingRepository);
  @override
  Future<Result<ResponseWrapper<User>>> call(NoParams params) async {
    return settingRepository.getMyProfile();
  }
}
