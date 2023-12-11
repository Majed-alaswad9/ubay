import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/domain/repository/prefs_repository.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/setting/presintation/widget/card_settings.dart';
import 'package:user/generated/locale_keys.g.dart';

class AccountAndSecurity extends StatelessWidget {
  const AccountAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: UBayAppBar(
          appBarParams: AppBarParams(
              title: LocaleKeys.settings_account_and_security.tr(),
              tittleStyle:
                  context.textTheme.titleMedium!.withColor(Colors.white)),
          isLeading: true,
        ),
        body: Padding(
          padding: HWEdgeInsets.all(8),
          child: ListView(
            children: [
              Card(
                  color: Colors.white,
                  child: Padding(
                    padding: HWEdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextView(LocaleKeys.profile.tr(),
                            style: context.textTheme.bodyLarge.b),
                        20.verticalSpace,
                        InkWell(
                          onTap: () {
                            context.pushNamed(
                                GRouter.config.settingScreen.profileScreen);
                          },
                          child: CardSettings(title: LocaleKeys.profile.tr()),
                        ),
                        10.verticalSpace,
                        const Divider(),
                        10.verticalSpace,
                        InkWell(
                          onTap: () {
                            context.pushNamed(GRouter
                                .config.settingScreen.updateProfileScreen);
                          },
                          child: CardSettings(
                              title: LocaleKeys.settings_update_profile.tr()),
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Card(
                  color: Colors.white,
                  child: Padding(
                    padding: HWEdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextView(
                            LocaleKeys.settings_privacy_and_security.tr(),
                            style: context.textTheme.bodyLarge.b),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            context.pushNamed(GRouter
                                .config.settingScreen.changePasswordScreen);
                          },
                          child: CardSettings(
                              title: LocaleKeys.settings_change_password.tr()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        CardSettings(
                            title: LocaleKeys.login_screen_ForgetPassword.tr())
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Card(
                  color: Colors.white,
                  child: Padding(
                    padding: HWEdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextView(LocaleKeys.settings_account.tr(),
                            style: context.textTheme.bodyLarge.b),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            GetIt.I<PrefsRepository>()
                                .clearUser()
                                .then((value) {
                              print(value);
                              context.goNamed(GRouter.config.authRoutes.login);
                            });
                          },
                          child: CardSettings(title: LocaleKeys.logout.tr()),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}