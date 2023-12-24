import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_model.freezed.dart';
part 'products_model.g.dart';

@freezed
class ProductsModel with _$ProductsModel {
  factory ProductsModel(
      {required int pageNumber,
      required int totalPages,
      required int totalDataCount,
      List<Product>? data}) = _ProductsModel;

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
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
class Product with _$Product {
  factory Product(
      {@JsonKey(name: '_id') required String id,
      required String title,
      required String content,
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
      required bool likedByMe}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
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
      DateTime? createdAt,
      DateTime? updatedAt}) = _Coupons;

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
