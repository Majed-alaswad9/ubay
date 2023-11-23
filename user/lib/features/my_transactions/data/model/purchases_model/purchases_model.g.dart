// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchasesModelImpl _$$PurchasesModelImplFromJson(Map<String, dynamic> json) =>
    _$PurchasesModelImpl(
      wait: (json['wait'] as List<dynamic>)
          .map((e) => CustomerElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      seller: (json['seller'] as List<dynamic>)
          .map((e) => CustomerElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: (json['customer'] as List<dynamic>)
          .map((e) => CustomerElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PurchasesModelImplToJson(
        _$PurchasesModelImpl instance) =>
    <String, dynamic>{
      'wait': instance.wait,
      'seller': instance.seller,
      'customer': instance.customer,
    };

_$CustomerElementImpl _$$CustomerElementImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerElementImpl(
      id: json['id'] as String,
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      customerDate: DateTime.parse(json['customerDate'] as String),
      sellerDate: DateTime.parse(json['sellerDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      product: Unpaid.fromJson(json['product'] as Map<String, dynamic>),
      seller: Customer.fromJson(json['seller'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerElementImplToJson(
        _$CustomerElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment': instance.payment,
      'customerDate': instance.customerDate.toIso8601String(),
      'sellerDate': instance.sellerDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'product': instance.product,
      'seller': instance.seller,
    };
