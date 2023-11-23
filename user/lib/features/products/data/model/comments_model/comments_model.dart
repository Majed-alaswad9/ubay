import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_model.freezed.dart';
part 'comments_model.g.dart';

@freezed
class CommentsModel with _$CommentsModel {
  const factory CommentsModel({
    required int pageNumber,
    required int totalPages,
    required int totalDataCount,
    List<DataComment>? data,
  }) = _CommentsModel;

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);
}

@freezed
class DataComment with _$DataComment {
  const factory DataComment({
    required String id,
    required String content,
    required User user,
    required String product,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DataComment;

  factory DataComment.fromJson(Map<String, dynamic> json) =>
      _$DataCommentFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String photo,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
