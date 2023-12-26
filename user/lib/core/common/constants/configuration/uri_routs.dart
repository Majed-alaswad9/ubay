abstract class EndPoints {
  EndPoints._();

  static const String baseUrl = 'http://192.168.1.102:3000/api/v1/';
  static const String socketUrl = 'ws://192.168.1.102:3000';
  static const auth = Auth();
  static const product = Product();
  static const stores = Stores();
  static const chats = Chat();
  static const user = User();
}

class Auth {
  const Auth();
  final login = '/users/login';
  final signup = '/users/signup';
  final forgotPassword = '/users/forgotPassword';
  final resetPassword = '/users/resetPassword';
}

class Product {
  const Product();

  final product = '/products';
  final likes = '/likes';
  final productMine = '/products/mine';
  final category = '/categories';
  final comments = '/comments';
  final coupons = '/coupons';
  final payment = '/payments';
}

class Stores {
  const Stores();

  final stores = '/stores';
}

class Chat {
  const Chat();
  final chat = '/chats';
  final messages = '/messages';
}

class User {
  const User();
  final user = '/users/me';
  final favourites = '/users/favorites';
  final updateMyPassword = '/users/updateMyPassword';
}
