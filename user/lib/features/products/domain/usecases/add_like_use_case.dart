import 'package:injectable/injectable.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

import '../../../../core/api/result.dart';

@injectable
class AddLikeUseCase extends UseCase<Result<void>, String> {
  final HomeRepository homeRepository;

  AddLikeUseCase(this.homeRepository);
  @override
  Future<Result<void>> call(String params) async {
    return homeRepository.addLike(params);
  }
}
