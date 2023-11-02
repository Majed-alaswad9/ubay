import 'package:user/features/posts/data/model/posts_model.dart';

abstract class EndPoints {
  EndPoints._();

  static const String baseUrl = 'http://192.168.1.100:3000/api/v1/';
  static const auth = Auth();
  static const product = Product();
  static const stores = Stores();
}

class Auth {
  const Auth();
  final login = '/users/login';
  final signup = '/users/signup';
  final forgotPassword = '/users/forgotPassword';
  final resetPassword = '/users/resetPassword';
  final updateMyPassword = '/users/updateMyPassword';
}

class Product {
  const Product();

  final product = '/products';
  final likes = '/likes';
  final productMine = '/products/mine';
  final category = '/categories';
}

class Stores {
  const Stores();

  final stores = '/stores';
}
