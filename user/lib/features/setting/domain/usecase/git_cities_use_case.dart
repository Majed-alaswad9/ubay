import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/data/model/category_model/category_model.dart';
import 'package:user/features/setting/domain/repository/setting_repository.dart';

@injectable
class GetCitiesUseCase
    extends UseCase<Result<ResponseWrapper<CategoryModel>>, NoParams> {
  final SettingRepository settingRepository;

  GetCitiesUseCase(this.settingRepository);
  @override
  Future<Result<ResponseWrapper<CategoryModel>>> call(NoParams params) async {
    return settingRepository.getCities();
  }
}
