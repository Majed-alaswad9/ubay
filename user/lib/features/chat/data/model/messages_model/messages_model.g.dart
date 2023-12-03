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
          .map((e) => DataMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessagesModelImplToJson(_$MessagesModelImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'totalPages': instance.totalPages,
      'totalDataCount': instance.totalDataCount,
      'data': instance.data,
    };

_$DataMessageImpl _$$DataMessageImplFromJson(Map<String, dynamic> json) =>
    _$DataMessageImpl(
      id: json['_id'] as String,
      content: json['content'] as String,
      user: json['user'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DataMessageImplToJson(_$DataMessageImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
    };
