import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../products/data/model/posts_model.dart';

part 'sales_model.freezed.dart';
part 'sales_model.g.dart';

@freezed
class SalesModel with _$SalesModel {
  const factory SalesModel({
    required List<CustomerElement> wait,
    required List<CustomerElement> seller,
    required List<CustomerElement> customer,
    required List<Unpaid> unpaid,
  }) = _SalesModel;

  factory SalesModel.fromJson(Map<String, dynamic> json) =>
      _$SalesModelFromJson(json);
}

@freezed
class CustomerElement with _$CustomerElement {
  const factory CustomerElement({
    @JsonKey(name: '_id') required String id,
    required Payment payment,
    @JsonKey(name: 'customer_date') DateTime? customerDate,
    @JsonKey(name: 'seller_date') DateTime? sellerDate,
    required Unpaid product,
  }) = _CustomerElement;

  factory CustomerElement.fromJson(Map<String, dynamic> json) =>
      _$CustomerElementFromJson(json);
}

@freezed
class Payment with _$Payment {
  const factory Payment({
    @JsonKey(name: '_id') required String id,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

@freezed
class Unpaid with _$Unpaid {
  const factory Unpaid({
    @JsonKey(name: '_id') required String id,
    required String title,
    required List<String> photos,
    required int price,
  }) = _Unpaid;

  factory Unpaid.fromJson(Map<String, dynamic> json) => _$UnpaidFromJson(json);
}
