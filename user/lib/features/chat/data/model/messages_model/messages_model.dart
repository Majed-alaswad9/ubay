import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_model.freezed.dart';
part 'messages_model.g.dart';

@freezed
class MessagesModel with _$MessagesModel {
  const factory MessagesModel({
    required int pageNumber,
    required int totalPages,
    required int totalDataCount,
    required List<DataMessage> data,
  }) = _MessagesModel;

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);
}

@freezed
class DataMessage with _$DataMessage {
  const factory DataMessage({
    @JsonKey(name: '_id') required String id,
    required String content,
    required String user,
    required DateTime createdAt,
  }) = _DataMessage;

  factory DataMessage.fromJson(Map<String, dynamic> json) =>
      _$DataMessageFromJson(json);
}
