import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/data/model/products_model.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class GetAllPostsUseCase extends UseCase<Result<ResponseWrapper<ProductsModel>>,
    GetAllProductsParams> {
  final HomeRepository homeRepository;

  GetAllPostsUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<ProductsModel>>> call(
      GetAllProductsParams params) async {
    return homeRepository.getAllProducts(params);
  }
}

class GetAllProductsParams {
  final int page;
  final int limit;

  GetAllProductsParams(this.page, this.limit);

  Map<String, String> get map =>
      {'page': '$page', 'limit': '$limit', 'is_paid': 'false'};
}
