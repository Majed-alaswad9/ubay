import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/data/model/products_model.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class GetProductUseCase
    extends UseCase<Result<ResponseWrapper<Product>>, String> {
  final HomeRepository homeRepository;

  GetProductUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<Product>>> call(String params) async {
    return homeRepository.getProduct(params);
  }
}
