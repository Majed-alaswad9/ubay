import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class DeleteProductUseCase extends UseCase<Result<void>, String> {
  final HomeRepository homeRepository;

  DeleteProductUseCase(this.homeRepository);
  @override
  Future<Result<void>> call(String params) async {
    return homeRepository.deleteProduct(params);
  }
}
