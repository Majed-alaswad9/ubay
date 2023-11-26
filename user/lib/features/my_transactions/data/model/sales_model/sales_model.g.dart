// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesModelImpl _$$SalesModelImplFromJson(Map<String, dynamic> json) =>
    _$SalesModelImpl(
      wait: (json['wait'] as List<dynamic>)
          .map((e) => CustomerElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      seller: (json['seller'] as List<dynamic>)
          .map((e) => CustomerElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: (json['customer'] as List<dynamic>)
          .map((e) => CustomerElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      unpaid: (json['unpaid'] as List<dynamic>)
          .map((e) => Unpaid.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SalesModelImplToJson(_$SalesModelImpl instance) =>
    <String, dynamic>{
      'wait': instance.wait,
      'seller': instance.seller,
      'customer': instance.customer,
      'unpaid': instance.unpaid,
    };

_$CustomerElementImpl _$$CustomerElementImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerElementImpl(
      id: json['_id'] as String,
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      customerDate: json['customer_date'] == null
          ? null
          : DateTime.parse(json['customer_date'] as String),
      sellerDate: json['seller_date'] == null
          ? null
          : DateTime.parse(json['seller_date'] as String),
      product: Unpaid.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerElementImplToJson(
        _$CustomerElementImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'payment': instance.payment,
      'customer_date': instance.customerDate?.toIso8601String(),
      'seller_date': instance.sellerDate?.toIso8601String(),
      'product': instance.product,
    };

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
    };

_$UnpaidImpl _$$UnpaidImplFromJson(Map<String, dynamic> json) => _$UnpaidImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as int,
    );

Map<String, dynamic> _$$UnpaidImplToJson(_$UnpaidImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'photos': instance.photos,
      'price': instance.price,
    };
