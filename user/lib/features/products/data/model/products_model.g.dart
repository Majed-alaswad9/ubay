// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductsModelImpl _$$ProductsModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductsModelImpl(
      pageNumber: json['pageNumber'] as int,
      totalPages: json['totalPages'] as int,
      totalDataCount: json['totalDataCount'] as int,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductsModelImplToJson(_$ProductsModelImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'totalPages': instance.totalPages,
      'totalDataCount': instance.totalDataCount,
      'data': instance.data,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      isPaid: json['is_paid'] as bool,
      price: json['price'] as int,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      coupons: (json['coupons'] as List<dynamic>?)
          ?.map((e) => Coupons.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      likes: json['likes'] as int,
      comments: json['comments'] as int,
      likedByMe: json['likedByMe'] as bool,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'photos': instance.photos,
      'is_paid': instance.isPaid,
      'price': instance.price,
      'category': instance.category,
      'coupons': instance.coupons,
      'user': instance.user,
      'store': instance.store,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'likes': instance.likes,
      'comments': instance.comments,
      'likedByMe': instance.likedByMe,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_$CouponsImpl _$$CouponsImplFromJson(Map<String, dynamic> json) =>
    _$CouponsImpl(
      id: json['_id'] as String,
      user: json['user'] as String?,
      product: json['product'] as String?,
      expire: json['expire'] == null
          ? null
          : DateTime.parse(json['expire'] as String),
      discount: json['discount'] as int?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CouponsImplToJson(_$CouponsImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'product': instance.product,
      'expire': instance.expire?.toIso8601String(),
      'discount': instance.discount,
      'active': instance.active,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'city': instance.city,
    };

_$CityImpl _$$CityImplFromJson(Map<String, dynamic> json) => _$CityImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CityImplToJson(_$CityImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
