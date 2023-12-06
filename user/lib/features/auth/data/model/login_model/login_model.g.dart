// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      token: json['token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String,
      favoriteCategories: (json['favoriteCategories'] as List<dynamic>)
          .map((e) => Favorite.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteCities: (json['favoriteCities'] as List<dynamic>)
          .map((e) => Favorite.fromJson(e as Map<String, dynamic>))
          .toList(),
      wallet: Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      role: json['role'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'favoriteCategories': instance.favoriteCategories,
      'favoriteCities': instance.favoriteCities,
      'wallet': instance.wallet,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'role': instance.role,
      'id': instance.id,
    };

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      id: json['_id'] as String,
      user: json['user'] as String,
      total: json['total'] as int,
      pending: json['pending'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      available: json['available'] as int,
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'total': instance.total,
      'pending': instance.pending,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'available': instance.available,
    };

_$FavoriteImpl _$$FavoriteImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      favoriteCategoryId: json['favoriteCategoryId'] as String,
    );

Map<String, dynamic> _$$FavoriteImplToJson(_$FavoriteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'favoriteCategoryId': instance.favoriteCategoryId,
    };
