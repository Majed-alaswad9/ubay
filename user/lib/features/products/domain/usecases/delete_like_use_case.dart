import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class DeleteLikeUseCase extends UseCase<Result<void>, String> {
  final HomeRepository homeRepository;

  DeleteLikeUseCase(this.homeRepository);
  @override
  Future<Result<void>> call(String params) async {
    return homeRepository.deleteLike(params);
  }
}
