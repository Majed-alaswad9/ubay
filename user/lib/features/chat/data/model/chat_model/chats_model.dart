import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_model.freezed.dart';
part 'chats_model.g.dart';

@freezed
class ChatsModel with _$ChatsModel {
  const factory ChatsModel({
    required int result,
    required List<Data> data,
  }) = _ChatsModel;

  factory ChatsModel.fromJson(Map<String, dynamic> json) =>
      _$ChatsModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required String id,
    required String name,
    required Customer? customer,
    required Customer? seller,
    required Product? product,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? lastMessage,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Customer with _$Customer {
  const factory Customer({
    required String id,
    required String name,
    required String photo,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String title,
    required List<String> photos,
    required int price,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
