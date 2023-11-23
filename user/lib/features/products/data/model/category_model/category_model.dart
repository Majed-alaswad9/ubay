import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int totalDataCount,
    required List<DataCategory> data,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class DataCategory with _$DataCategory {
  const factory DataCategory({
    required String id,
    required String name,
  }) = _DataCategory;

  factory DataCategory.fromJson(Map<String, dynamic> json) =>
      _$DataCategoryFromJson(json);
}
