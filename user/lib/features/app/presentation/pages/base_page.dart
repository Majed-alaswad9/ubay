import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key, required this.child});

  final StatefulNavigationShell child;

  void _onTap(BuildContext context, int index) {
    child.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: child,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: child.currentIndex,
        selectedItemColor: context.colorScheme.primary,
        unselectedItemColor: context.colorScheme.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'home',
              activeIcon: Icon(
                Icons.home,
                color: context.colorScheme.primary,
              )),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.transfer_within_a_station,
              ),
              label: 'trans',
              activeIcon: Icon(
                Icons.transfer_within_a_station,
                color: context.colorScheme.primary,
              )),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.chat,
              ),
              label: 'chat',
              activeIcon: Icon(
                Icons.chat,
                color: context.colorScheme.primary,
              )),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.person,
              ),
              label: 'profile',
              activeIcon: Icon(
                Icons.person,
                color: context.colorScheme.primary,
              )),
        ],
        onTap: (index) => _onTap(context, index),
      ),
    );
  }
}
