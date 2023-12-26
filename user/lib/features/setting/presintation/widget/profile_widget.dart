import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/common/constants/constants.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/util/core_helper.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../../core/util/chose_date_time.dart';
import '../../../../core/util/header_curved.dart';
import '../../../app/presentation/widgets/app_text_view.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {super.key,
      required this.photo,
      required this.name,
      required this.email,
      required this.createdAt,
      required this.total,
      required this.pending});
  final String photo;
  final String name;
  final String email;
  final DateTime createdAt;
  final int total;
  final int pending;

  @override
  Widget build(BuildContext context) {
    final HeaderCurvedContainer headerCurvedContainer =
        HeaderCurvedContainer(context: context);
    return ListView(
      children: [
        Card(
          child: CustomPaint(
            painter: headerCurvedContainer,
          ),
        ),
        150.verticalSpace,
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.photo),
              radius: 60.r,
            ),
          ],
        ),
        Card(
          margin: HWEdgeInsets.all(10),
          color: Colors.white,
          child: Padding(
            padding: HWEdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                AppTextView(LocaleKeys.signup_screen_FullName.tr(),
                    style: context.textTheme.titleMedium!
                        .copyWith(color: context.colorScheme.primary)),
                AppTextView(name, style: context.textTheme.titleSmall),
                10.verticalSpace,
                AppTextView(LocaleKeys.login_screen_Email.tr(),
                    style: context.textTheme.titleMedium!
                        .copyWith(color: context.colorScheme.primary)),
                AppTextView(email, style: context.textTheme.titleSmall),
                10.verticalSpace,
                AppTextView(LocaleKeys.use_ago.tr(),
                    style: context.textTheme.titleMedium!
                        .copyWith(color: context.colorScheme.primary)),
                AppTextView(ChoseDateTime().chose(createdAt),
                    style: context.textTheme.titleSmall),
                const Divider(),
                IconButton(
                    onPressed: () {
                      context.pushNamed(
                          GRouter.config.settingRoutes.updateProfileScreen);
                    },
                    icon: Icon(
                      Icons.edit,
                      color: context.colorScheme.primary,
                    ))
              ],
            ),
          ),
        ),
        Card(
          color: Colors.white,
          margin: HWEdgeInsets.all(10),
          child: Padding(
            padding: HWEdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.wallet,
                      color: context.colorScheme.primary,
                    ),
                    5.horizontalSpace,
                    AppTextView(LocaleKeys.settings_total_money.tr(),
                        style: context.textTheme.bodyMedium!
                            .copyWith(color: context.colorScheme.primary)),
                    10.horizontalSpace,
                    AppTextView(
                        '${CoreHelper.handlePrice(CoreHelper.formatter.format(total))} ل س',
                        style: context.textTheme.bodyMedium!
                            .copyWith(color: context.colorScheme.secondary))
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.pending,
                      color: context.colorScheme.primary,
                    ),
                    5.horizontalSpace,
                    AppTextView(LocaleKeys.settings_pending_money.tr(),
                        style: context.textTheme.bodyMedium!
                            .copyWith(color: context.colorScheme.primary)),
                    10.horizontalSpace,
                    AppTextView(
                        '${CoreHelper.handlePrice(CoreHelper.formatter.format(pending))} ل س',
                        style: context.textTheme.bodyMedium!
                            .copyWith(color: context.colorScheme.secondary))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
