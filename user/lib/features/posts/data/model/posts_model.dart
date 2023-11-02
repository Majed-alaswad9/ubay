import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class PostsModel with _$PostsModel {
  const PostsModel._();
  factory PostsModel(
      {required int pageNumber,
      required int totalPages,
      required int totalDataCount,
      required List<Data> data}) = _PostsModel;

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);
}

@freezed
class User with _$User {
  factory User(
      {@JsonKey(name: '_id') required String id,
      required String name,
      required String photo}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data(
      {@JsonKey(name: '_id') required String id,
      required String title,
      required String content,
      List<String>? likedBy,
      required List<String> photos,
      @JsonKey(name: 'is_paid') required bool isPaid,
      required int price,
      Category? category,
      List<Coupons>? coupons,
      User? user,
      Store? store,
      required DateTime createdAt,
      required DateTime updatedAt,
      required int likes,
      required int comments,
      required bool likedByMe}) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Category with _$Category {
  factory Category(
      {@JsonKey(name: '_id') required String id,
      required String name,
      required String description}) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Coupons with _$Coupons {
  factory Coupons(
      {@JsonKey(name: '_id') required String id,
      String? user,
      String? product,
      DateTime? expire,
      int? discount,
      bool? active,
      required DateTime createdAt,
      required DateTime updatedAt}) = _Coupons;

  factory Coupons.fromJson(Map<String, dynamic> json) =>
      _$CouponsFromJson(json);
}

@freezed
class Store with _$Store {
  factory Store(
      {@JsonKey(name: '_id') required String id,
      required String name,
      City? city}) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@freezed
class City with _$City {
  factory City(
      {@JsonKey(name: '_id') required String id, required String name}) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
