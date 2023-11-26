import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_model.freezed.dart';
part 'messages_model.g.dart';

@freezed
class MessagesModel with _$MessagesModel {
  const factory MessagesModel({
    required int pageNumber,
    required int totalPages,
    required int totalDataCount,
    required List<Data> data,
  }) = _MessagesModel;

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: '_id') required String id,
    required String content,
    required String user,
    required DateTime createdAt,
    required String datumId,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
