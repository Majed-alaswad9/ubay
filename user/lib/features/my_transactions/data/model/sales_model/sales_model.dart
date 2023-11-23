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
    required String id,
    required Payment payment,
    required DateTime customerDate,
    required DateTime sellerDate,
    required DateTime createdAt,
    required Customer customer,
    required Unpaid product,
  }) = _CustomerElement;

  factory CustomerElement.fromJson(Map<String, dynamic> json) =>
      _$CustomerElementFromJson(json);
}

@freezed
class Customer with _$Customer {
  const factory Customer({
    required String id,
    required String name,
    required String photo,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

@freezed
class Payment with _$Payment {
  const factory Payment({
    required String id,
    required bool isDiscount,
    required DateTime createdAt,
    required int priceAfter,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

@freezed
class Unpaid with _$Unpaid {
  const factory Unpaid({
    required String id,
    required String title,
    required List<String> photos,
    required int price,
    required String category,
    required String store,
    required List<Coupons> coupons,
  }) = _Unpaid;

  factory Unpaid.fromJson(Map<String, dynamic> json) => _$UnpaidFromJson(json);
}
