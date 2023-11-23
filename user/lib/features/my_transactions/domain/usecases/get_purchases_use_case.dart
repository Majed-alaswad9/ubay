import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/my_transactions/data/model/purchases_model/purchases_model.dart';
import 'package:user/features/my_transactions/domain/repository/transactions_repository.dart';

@injectable
class GetMyPurchasesUseCase
    extends UseCase<Result<ResponseWrapper<PurchasesModel>>, NoParams> {
  final TransactionsRepository transactionsRepository;

  GetMyPurchasesUseCase(this.transactionsRepository);
  @override
  Future<Result<ResponseWrapper<PurchasesModel>>> call(NoParams params) async {
    return transactionsRepository.getMyPurchases();
  }
}
