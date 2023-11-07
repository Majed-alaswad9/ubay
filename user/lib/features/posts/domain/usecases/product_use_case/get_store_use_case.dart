import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/posts/data/model/city_model/city_model.dart';
import 'package:user/features/posts/domain/repository/home_repository.dart';

@injectable
class GetStoreUseCase
    extends UseCase<Result<ResponseWrapper<StoreModel>>, NoParams> {
  final HomeRepository homeRepository;

  GetStoreUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<StoreModel>>> call(NoParams params) async {
    return homeRepository.getStore();
  }
}
