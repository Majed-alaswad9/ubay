import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class DeleteCouponUseCase extends UseCase<Result<bool>, String> {
  final HomeRepository homeRepository;

  DeleteCouponUseCase(this.homeRepository);
  @override
  Future<Result<bool>> call(String params) async {
    return homeRepository.deleteCoupon(params);
  }
}
