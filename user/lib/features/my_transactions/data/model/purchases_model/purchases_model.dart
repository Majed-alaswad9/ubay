import 'package:freezed_annotation/freezed_annotation.dart';

import '../sales_model/sales_model.dart';

part 'purchases_model.freezed.dart';
part 'purchases_model.g.dart';

@freezed
class PurchasesModel with _$PurchasesModel {
  const factory PurchasesModel({
    required List<CustomerElement> wait,
    required List<CustomerElement> seller,
    required List<CustomerElement> customer,
  }) = _PurchasesModel;

  factory PurchasesModel.fromJson(Map<String, dynamic> json) =>
      _$PurchasesModelFromJson(json);
}

@freezed
class CustomerElement with _$CustomerElement {
  const factory CustomerElement({
    @JsonKey(name: '_id') required String id,
    required Payment payment,
    @JsonKey(name: 'customer_date') DateTime? customerDate,
    @JsonKey(name: 'seller_date') DateTime? sellerDate,
    required DateTime createdAt,
    required Unpaid product,
    required Customer seller,
  }) = _CustomerElement;

  factory CustomerElement.fromJson(Map<String, dynamic> json) =>
      _$CustomerElementFromJson(json);
}
