// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      totalDataCount: json['totalDataCount'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'totalDataCount': instance.totalDataCount,
      'data': instance.data,
    };

_$DataCategoryImpl _$$DataCategoryImplFromJson(Map<String, dynamic> json) =>
    _$DataCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DataCategoryImplToJson(_$DataCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
