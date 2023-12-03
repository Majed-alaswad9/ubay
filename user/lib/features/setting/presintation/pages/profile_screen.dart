import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/generated/locale_keys.g.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: UBayAppBar(
            appBarParams:
                AppBarParams(title: LocaleKeys.profile.tr(), centerTitle: true),
            isLeading: true),
        body: ListView(
          children: [CircleAvatar()],
        ));
  }
}
