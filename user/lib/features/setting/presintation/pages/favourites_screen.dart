import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/config/themes/app_theme.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_scaffold.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/params_appbar.dart';
import 'package:user/features/app/presentation/widgets/ubay_appbar.dart';
import 'package:user/features/setting/presintation/bloc/setting_bloc.dart';
import 'package:user/features/setting/presintation/widget/cities_drop_down.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../products/data/model/category_model/category_model.dart';
import '../../../products/presintation/widget/drop_down_category.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  DataCategory? dropDownCityValue;
  late List<DataCategory> lisCities = [];
  late SettingBloc _bloc;
  @override
  void initState() {
    _bloc = context.read<SettingBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: UBayAppBar(
            isLeading: true,
            appBarParams: AppBarParams(
                title: LocaleKeys.settings_post_preferences.tr(),
                tittleStyle:
                    context.textTheme.titleMedium.withColor(Colors.white),
                centerTitle: true)),
        body: Padding(
          padding: HWEdgeInsets.all(kpPaddingPage),
          child: ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              20.verticalSpace,
              Center(
                child: SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          AppTextView(
                            LocaleKeys.save.tr(),
                            style: context.textTheme.titleSmall
                                .withColor(Colors.white),
                          ),
                          5.horizontalSpace,
                          const Icon(
                            Icons.save,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
