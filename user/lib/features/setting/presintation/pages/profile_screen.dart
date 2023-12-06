import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/common/constants/constants.dart';
import 'package:user/core/common/model/page_state/result_builder.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/setting/presintation/widget/profile_widget.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../bloc/setting_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<SettingBloc>().add(GetMeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: UBayAppBar(
            appBarParams: AppBarParams(
                title: LocaleKeys.profile.tr(),
                tittleStyle:
                    context.textTheme.titleMedium!.withColor(Colors.white),
                centerTitle: true),
            isLeading: true),
        body: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return PageStateBuilder<UserModel>(
              init: const SizedBox.shrink(),
              success: (UserModel data) {
                return ProfileWidget(
                    photo: data.photo,
                    name: data.name,
                    email: data.email,
                    createdAt: data.createdAt,
                    total: data.wallet.total,
                    pending: data.wallet.pending);
              },
              loading: ProfileWidget(
                photo: user.photo,
                name: user.name,
                email: user.email,
                createdAt: user.createdAt,
                total: user.wallet.total,
                pending: user.wallet.pending,
              ),
              error: (Exception? error) {
                return Center(
                  child: AppTextView(
                    error.toString(),
                    style: context.textTheme.titleMedium,
                  ),
                );
              },
              result: state.profileMe,
              empty: const SizedBox.shrink(),
            );
          },
        ));
  }
}
