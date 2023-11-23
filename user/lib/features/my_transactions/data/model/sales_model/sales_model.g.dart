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
      id: json['id'] as String,
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      customerDate: DateTime.parse(json['customerDate'] as String),
      sellerDate: DateTime.parse(json['sellerDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      product: Unpaid.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerElementImplToJson(
        _$CustomerElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment': instance.payment,
      'customerDate': instance.customerDate.toIso8601String(),
      'sellerDate': instance.sellerDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'customer': instance.customer,
      'product': instance.product,
    };

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
    };

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: json['id'] as String,
      isDiscount: json['isDiscount'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      priceAfter: json['priceAfter'] as int,
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isDiscount': instance.isDiscount,
      'createdAt': instance.createdAt.toIso8601String(),
      'priceAfter': instance.priceAfter,
    };

_$UnpaidImpl _$$UnpaidImplFromJson(Map<String, dynamic> json) => _$UnpaidImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as int,
      category: json['category'] as String,
      store: json['store'] as String,
      coupons: (json['coupons'] as List<dynamic>)
          .map((e) => Coupons.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UnpaidImplToJson(_$UnpaidImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'photos': instance.photos,
      'price': instance.price,
      'category': instance.category,
      'store': instance.store,
      'coupons': instance.coupons,
    };
