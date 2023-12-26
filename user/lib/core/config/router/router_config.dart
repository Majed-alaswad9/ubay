class RouterConfiguration {
  RouterConfiguration.init();
  final String kRootRoute = '/splash';
  final authRoutes = const AuthRoutes._();
  final homeRoutes = const _HomeRoutes._();
  final chatRoutes = const _ChatRoutes._();
  final transactionRoutes = const _TransactionRoutes._();
  final settingRoutes = const _SettingsRoutes._();
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
  final String favouriteScreen = 'favouriteScreen';
}
