import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/setting/presintation/bloc/setting_bloc.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../products/presintation/bloc/home_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetCategoryEvent());
    context.read<SettingBloc>().add(GetCitiesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: UBayAppBar(
            appBarParams: AppBarParams(
                title: LocaleKeys.settings_setting.tr(),
                tittleStyle:
                    context.textTheme.titleMedium!.withColor(Colors.white)),
            isLeading: false),
        body: Padding(
          padding: HWEdgeInsets.all(20.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.goNamed(GRouter.config.settingRoutes.accountScreen);
                },
                child: Row(
                  children: [
                    AppTextView(LocaleKeys.settings_account_and_security.tr(),
                        style: context.textTheme.bodyLarge),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              InkWell(
                onTap: () => context
                    .pushNamed(GRouter.config.settingRoutes.favouriteScreen),
                child: Row(
                  children: [
                    AppTextView(LocaleKeys.settings_favourite.tr(),
                        style: context.textTheme.bodyLarge),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
