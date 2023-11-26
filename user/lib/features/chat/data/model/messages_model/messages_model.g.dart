// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessagesModelImpl _$$MessagesModelImplFromJson(Map<String, dynamic> json) =>
    _$MessagesModelImpl(
      pageNumber: json['pageNumber'] as int,
      totalPages: json['totalPages'] as int,
      totalDataCount: json['totalDataCount'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessagesModelImplToJson(_$MessagesModelImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'totalPages': instance.totalPages,
      'totalDataCount': instance.totalDataCount,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['_id'] as String,
      content: json['content'] as String,
      user: json['user'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      datumId: json['datumId'] as String,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
      'datumId': instance.datumId,
    };
