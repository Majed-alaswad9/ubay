class RouterConfiguration {
  RouterConfiguration.init();
  final String kRootRoute = '/splash';
  final authRoutes = const AuthRoutes._();
  final homeScreen = const _HomeRoutes._();
  final chatScreen = const _ChatRoutes._();
  final transactionScreen = const _TransactionRoutes._();
  final settingScreen = const _SettingsRoutes._();
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
  final String viewProductScreen = '/viewProductScreen';
}

class _ChatRoutes {
  const _ChatRoutes._();

  final String chatScreen = '/chatScreen';
}

class _TransactionRoutes {
  const _TransactionRoutes._();

  final String transactionScreen = '/transactionScreen';
}

class _SettingsRoutes {
  const _SettingsRoutes._();
  final String settings = '/settings';
  final String accountScreen = 'accountScreen';
  final String profileScreen = 'profileScreen';
  final String updateProfileScreen = 'updateProfileScreen';
  final String changePasswordScreen = 'changePasswordScreen';
}
