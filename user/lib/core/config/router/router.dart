import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/config/router/router_config.dart';
import 'package:user/features/app/presentation/pages/base_page.dart';
import 'package:user/features/auth/presentation/pages/login_page.dart';
import 'package:user/features/auth/presentation/pages/register_page.dart';
import 'package:user/features/chat/presentation/pages/chat_screen.dart';
import 'package:user/features/products/data/model/products_model.dart';
import 'package:user/features/products/presintation/pages/add_post_screen.dart';
import 'package:user/features/products/presintation/pages/home_screen.dart';
import 'package:user/features/products/presintation/pages/view_product.dart';
import 'package:user/features/setting/presintation/pages/accont_and_security.dart';
import 'package:user/features/setting/presintation/pages/change_password_screen.dart';
import 'package:user/features/setting/presintation/pages/favourites_screen.dart';
import 'package:user/features/setting/presintation/pages/profile_screen.dart';
import 'package:user/features/setting/presintation/pages/setting_screen.dart';
import 'package:user/features/setting/presintation/pages/update_profile_screen.dart';
import 'package:user/features/welcome/splash.dart';

import '../../../features/my_transactions/presintation/pages/transaction_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');
GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;
GlobalKey<NavigatorState> get homeNavigatorKey => _homeNavigatorKey;

class GRouter {
  static GoRouter get router => _router;

  static RouterConfiguration get config => _config;

  static final RouterConfiguration _config = RouterConfiguration.init();

  static final GoRouter _router = GoRouter(
      initialLocation: _config.kRootRoute,
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        GoRoute(
            path: _config.kRootRoute,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(child: const SplashScreen(), state: state);
            }),
        GoRoute(
            path: _config.authRoutes.login,
            name: _config.authRoutes.login,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(child: const LoginPage(), state: state);
            }),
        GoRoute(
            path: _config.authRoutes.signup,
            name: _config.authRoutes.signup,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(child: const RegisterPage(), state: state);
            }),
        GoRoute(
            path: _config.homeRoutes.viewProductScreen,
            name: _config.homeRoutes.viewProductScreen,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(
                  child: ViewProduct(id: state.extra as String), state: state);
            }),
        StatefulShellRoute.indexedStack(
          builder: (context, state, child) {
            return BasePage(child: child);
          },
          branches: [
            StatefulShellBranch(
                initialLocation: _config.homeRoutes.homeScreen,
                navigatorKey: _homeNavigatorKey,
                routes: [
                  GoRoute(
                      path: _config.homeRoutes.homeScreen,
                      name: _config.homeRoutes.homeScreen,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _builderPage(
                            child: const HomeScreen(), state: state);
                      },
                      routes: [
                        GoRoute(
                            path: _config.homeRoutes.addPostScreen,
                            name: _config.homeRoutes.addPostScreen,
                            parentNavigatorKey: _rootNavigatorKey,
                            pageBuilder:
                                (BuildContext context, GoRouterState state) {
                              return _builderPage(
                                  child: AddPostScreen(
                                      params:
                                          state.extra as AddPostScreenParams),
                                  state: state);
                            }),
                      ])
                ]),
            StatefulShellBranch(
                initialLocation: _config.transactionRoutes.transactionScreen,
                routes: [
                  GoRoute(
                      path: _config.transactionRoutes.transactionScreen,
                      name: _config.transactionRoutes.transactionScreen,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _builderPage(
                            child: const TransactionScreen(), state: state);
                      })
                ]),
            StatefulShellBranch(
                initialLocation: _config.chatRoutes.chatScreen,
                routes: [
                  GoRoute(
                      path: _config.chatRoutes.chatScreen,
                      name: _config.chatRoutes.chatScreen,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _builderPage(
                            child: const ChatScreen(), state: state);
                      })
                ]),
            StatefulShellBranch(
                initialLocation: _config.settingRoutes.settings,
                routes: [
                  GoRoute(
                      path: _config.settingRoutes.settings,
                      name: _config.settingRoutes.settings,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _builderPage(
                            child: const SettingScreen(), state: state);
                      },
                      routes: [
                        GoRoute(
                            path: _config.settingRoutes.accountScreen,
                            name: _config.settingRoutes.accountScreen,
                            parentNavigatorKey: _rootNavigatorKey,
                            pageBuilder:
                                (BuildContext context, GoRouterState state) {
                              return _builderPage(
                                  child: const AccountAndSecurity(),
                                  state: state);
                            },
                            routes: [
                              GoRoute(
                                  path: _config.settingRoutes.profileScreen,
                                  name: _config.settingRoutes.profileScreen,
                                  parentNavigatorKey: _rootNavigatorKey,
                                  pageBuilder: (BuildContext context,
                                      GoRouterState state) {
                                    return _builderPage(
                                        child: const ProfileScreen(),
                                        state: state);
                                  }),
                              GoRoute(
                                  path:
                                      _config.settingRoutes.updateProfileScreen,
                                  name:
                                      _config.settingRoutes.updateProfileScreen,
                                  parentNavigatorKey: _rootNavigatorKey,
                                  pageBuilder: (BuildContext context,
                                      GoRouterState state) {
                                    return _builderPage(
                                        child: UpdateProfileScreen(),
                                        state: state);
                                  }),
                              GoRoute(
                                  path: _config
                                      .settingRoutes.changePasswordScreen,
                                  name: _config
                                      .settingRoutes.changePasswordScreen,
                                  parentNavigatorKey: _rootNavigatorKey,
                                  pageBuilder: (BuildContext context,
                                      GoRouterState state) {
                                    return _builderPage(
                                        child: const ChangePasswordScreen(),
                                        state: state);
                                  }),
                            ]),
                        GoRoute(
                            path: _config.settingRoutes.favouriteScreen,
                            name: _config.settingRoutes.favouriteScreen,
                            pageBuilder:
                                (BuildContext context, GoRouterState state) {
                              return _builderPage(
                                  child: FavouritesScreen(), state: state);
                            })
                      ])
                ]),
          ],
        )
      ]);

  static Page<dynamic> _builderPage<T>(
      {required Widget child, required GoRouterState state}) {
    if (Platform.isIOS) {
      return CupertinoPage<T>(child: child, key: state.pageKey);
    } else {
      return MaterialPage<T>(child: child, key: state.pageKey);
    }
  }
}
