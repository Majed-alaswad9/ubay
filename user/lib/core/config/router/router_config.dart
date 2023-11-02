class RouterConfiguration {
  RouterConfiguration.init();
  final String kRootRoute = '/splash';
  final authRoutes = const AuthRoutes._();
  final homeScreen = const _HomeRoutes._();
  final chatScreen = const _ChatRoutes._();
  final transactionScreen = const _TransactionRoutes._();
  final profileScreen = const _ProfileScreen._();
}

class AuthRoutes {
  const AuthRoutes._();

  final String login = '/login';
  final String signup = '/signup';
  final String forgotPassword = '/forgotPassword';
  final String resetPassword = '/resetPassword';
}

class _HomeRoutes {
  const _HomeRoutes._();

  final String homeScreen = '/homeScreen';
  final String addPostScreen = 'addPostScreen';
}

class _ChatRoutes {
  const _ChatRoutes._();

  final String chatScreen = '/chatScreen';
}

class _TransactionRoutes {
  const _TransactionRoutes._();

  final String transactionScreen = '/transactionScreen';
}

class _ProfileScreen {
  const _ProfileScreen._();

  final String profileScreen = '/profileScreen';
}
