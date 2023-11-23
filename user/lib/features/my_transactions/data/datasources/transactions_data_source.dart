import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/client.dart';
import 'package:user/core/api/client_config.dart';
import 'package:user/core/common/constants/configuration/uri_routs.dart';
import 'package:user/features/my_transactions/data/model/purchases_model/purchases_model.dart';
import 'package:user/features/my_transactions/data/model/sales_model/sales_model.dart';

import '../../../../core/common/model/response_wrapper/response_wrapper.dart';

@injectable
class TransactionsDataSource {
  final ClientApi clientApi;

  TransactionsDataSource(this.clientApi);

  Future<ResponseWrapper<SalesModel>> getMySales() {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.product.productMine,
          queryParameters: {'isBuy': "false"},
          clientMethod: ClientMethod.get));

      return ResponseWrapper.fromJson(response.data, (json) {
        final result = SalesModel.fromJson(response.data);
        return result;
      });
    });
  }

  Future<ResponseWrapper<PurchasesModel>> getMyPurchases() {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.product.productMine,
          queryParameters: {'isBuy': "true"},
          clientMethod: ClientMethod.get));

      return ResponseWrapper.fromJson(response.data, (json) {
        final result = PurchasesModel.fromJson(response.data);
        return result;
      });
    });
  }
}
