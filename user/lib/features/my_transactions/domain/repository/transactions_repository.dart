import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/my_transactions/data/model/purchases_model/purchases_model.dart';
import 'package:user/features/my_transactions/data/model/sales_model/sales_model.dart';

abstract class TransactionsRepository {
  Future<Result<ResponseWrapper<SalesModel>>> getMySales();
  Future<Result<ResponseWrapper<PurchasesModel>>> getMyPurchases();
}
