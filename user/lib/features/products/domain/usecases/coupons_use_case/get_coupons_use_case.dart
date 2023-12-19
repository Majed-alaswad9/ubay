import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/data/model/coupon_model/coupon_model.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class GetCouponsUseCase
    extends UseCase<Result<ResponseWrapper<CouponModel>>, GetCouponsParams> {
  final HomeRepository homeRepository;

  GetCouponsUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<CouponModel>>> call(
      GetCouponsParams params) async {
    return homeRepository.getCoupons(params);
  }
}

class GetCouponsParams {
  final String id;
  final String page;
  final String limit;
  final String sort;
  final String fields;
  final String search;

  GetCouponsParams(
      this.id, this.page, this.limit, this.sort, this.fields, this.search);

  Map<String, String> get map => {
        "page": page,
        "limit": limit,
        "sort": sort,
        "fields": fields,
        "search": search
      };
}
