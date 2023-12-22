import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class EditCouponUseCase extends UseCase<Result<bool>, EditCouponParams> {
  final HomeRepository homeRepository;

  EditCouponUseCase(this.homeRepository);
  @override
  Future<Result<bool>> call(EditCouponParams params) async {
    return homeRepository.editCoupon(params);
  }
}

class EditCouponParams {
  final String couponId;
  final String userId;
  final String productId;
  final int discount;
  DateTime? expire;

  EditCouponParams(
      {required this.couponId,
      required this.userId,
      required this.productId,
      required this.discount,
      this.expire});
  Map<String, dynamic> get map => {
        "user": userId,
        "product": productId,
        "expire": expire,
        "discount": discount
      };
}
