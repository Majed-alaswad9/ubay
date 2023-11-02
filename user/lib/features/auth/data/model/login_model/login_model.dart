// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';

part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  factory LoginModel({required String token, required User user}) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@freezed
class User with _$User {
  factory User(
      {required String name,
      required String email,
      required String photo,
      required List<String> favoriteCategories,
      required List<String> favoriteCities,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String role,
      required String id}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Wallet with _$Wallet {
  factory Wallet(
      {required String id,
      required String user,
      required int total,
      required int pending,
      required DateTime createdAt,
      required DateTime updatedAt,
      required int available}) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}
