import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/my_transactions/data/model/sales_model/sales_model.dart';
import 'package:user/features/my_transactions/domain/repository/transactions_repository.dart';

@injectable
class GetMySalesUseCase
    extends UseCase<Result<ResponseWrapper<SalesModel>>, NoParams> {
  final TransactionsRepository transactionsRepository;

  GetMySalesUseCase(this.transactionsRepository);
  @override
  Future<Result<ResponseWrapper<SalesModel>>> call(NoParams params) async {
    return transactionsRepository.getMySales();
  }
}
