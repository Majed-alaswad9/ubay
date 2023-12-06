import 'package:flutter/material.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';

abstract class PrefsRepository {
  String? get token;
  Future<bool> setToken(String token);
  Future<bool> setTheme(ThemeMode themeMode);
  ThemeMode get getTheme;
  Future<bool> clearUser();
  bool get registeredUser;
  UserModel? get user;
  Future<bool> setUser(UserModel user);
}
