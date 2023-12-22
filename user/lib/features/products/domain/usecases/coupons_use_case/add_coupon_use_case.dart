import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class AddCouponUseCase extends UseCase<Result<bool>, AddCouponParams> {
  final HomeRepository homeRepository;

  AddCouponUseCase(this.homeRepository);
  @override
  Future<Result<bool>> call(AddCouponParams params) async {
    return homeRepository.addCoupon(params);
  }
}

class AddCouponParams {
  final String userId;
  final String productId;
  final int discount;
  String? expire;

  AddCouponParams(this.userId, this.productId, this.discount, this.expire);

  Map<String, dynamic> get map => {
        "user": userId,
        "product": productId,
        "expire": expire,
        "discount": discount
      };
}
