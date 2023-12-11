import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/setting/domain/repository/setting_repository.dart';

@injectable
class EditProfileUseCase
    extends UseCase<Result<ResponseWrapper<UserModel>>, EditProfileParams> {
  final SettingRepository settingRepository;

  EditProfileUseCase(this.settingRepository);
  @override
  Future<Result<ResponseWrapper<UserModel>>> call(
      EditProfileParams params) async {
    return settingRepository.editMyProfile(params);
  }
}

class EditProfileParams {
  final String? name;
  final String? email;
  final File? photo;

  EditProfileParams({this.name, this.email, this.photo});

  Map<String, dynamic> get map =>
      {'name': name, 'email': email, 'photo': photo};
}
