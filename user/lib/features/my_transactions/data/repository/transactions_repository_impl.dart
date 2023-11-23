import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/my_transactions/data/datasources/transactions_data_source.dart';
import 'package:user/features/my_transactions/data/model/purchases_model/purchases_model.dart';
import 'package:user/features/my_transactions/data/model/sales_model/sales_model.dart';
import 'package:user/features/my_transactions/domain/repository/transactions_repository.dart';

@Injectable(as: TransactionsRepository)
class TransactionsRepositoryImplement implements TransactionsRepository {
  final TransactionsDataSource transactionsDataSource;

  TransactionsRepositoryImplement(this.transactionsDataSource);
  @override
  Future<Result<ResponseWrapper<PurchasesModel>>> getMyPurchases() {
    return toApiResult(() {
      final result = transactionsDataSource.getMyPurchases();
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<SalesModel>>> getMySales() {
    return toApiResult(() {
      final result = transactionsDataSource.getMySales();
      return result;
    });
  }
}
