import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/generated/locale_keys.g.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
