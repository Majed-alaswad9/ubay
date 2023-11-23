import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/config/router/router_config.dart';
import 'package:user/features/app/presentation/pages/base_page.dart';
import 'package:user/features/auth/presentation/pages/login_page.dart';
import 'package:user/features/auth/presentation/pages/register_page.dart';
import 'package:user/features/chat/presentation/pages/chat_screen.dart';
import 'package:user/features/products/presintation/pages/add_post_screen.dart';
import 'package:user/features/products/presintation/pages/home_screen.dart';
import 'package:user/features/products/presintation/widget/comments_widget.dart';
import 'package:user/features/profile/presintation/pages/profile_screen.dart';
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
              return _builderPage(child: LoginPage(), state: state);
            }),
        GoRoute(
            path: _config.authRoutes.signup,
            name: _config.authRoutes.signup,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _builderPage(child: RegisterPage(), state: state);
            }),
        StatefulShellRoute.indexedStack(
          builder: (context, state, child) {
            return BasePage(child: child);
          },
          branches: [
            StatefulShellBranch(
                initialLocation: _config.homeScreen.homeScreen,
                navigatorKey: _homeNavigatorKey,
                routes: [
                  GoRoute(
                      path: _config.homeScreen.homeScreen,
                      name: _config.homeScreen.homeScreen,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _builderPage(
                            child: const HomeScreen(), state: state);
                      },
                      routes: [
                        GoRoute(
                            path: _config.homeScreen.addPostScreen,
                            name: _config.homeScreen.addPostScreen,
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
                initialLocation: _config.transactionScreen.transactionScreen,
                routes: [
                  GoRoute(
                      path: _config.transactionScreen.transactionScreen,
                      name: _config.transactionScreen.transactionScreen,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _builderPage(
                            child: const TransactionScreen(), state: state);
                      })
                ]),
            StatefulShellBranch(
                initialLocation: _config.chatScreen.chatScreen,
                routes: [
                  GoRoute(
                      path: _config.chatScreen.chatScreen,
                      name: _config.chatScreen.chatScreen,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _builderPage(
                            child: const ChatScreen(), state: state);
                      })
                ]),
            StatefulShellBranch(
                initialLocation: _config.profileScreen.profileScreen,
                routes: [
                  GoRoute(
                      path: _config.profileScreen.profileScreen,
                      name: _config.profileScreen.profileScreen,
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return _builderPage(
                            child: const ProfileScreen(), state: state);
                      })
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
