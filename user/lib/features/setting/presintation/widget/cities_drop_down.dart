import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/setting/presintation/bloc/setting_bloc.dart';

import '../../../../core/common/model/page_state/result_builder.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../../app/presentation/widgets/loading_indicator.dart';
import '../../../products/data/model/category_model/category_model.dart';

class DropDownCities extends StatefulWidget {
  const DropDownCities({super.key, required this.widget});
  final Widget Function(CategoryModel) widget;

  @override
  State<DropDownCities> createState() => _DropDownCitiesState();
}

class _DropDownCitiesState extends State<DropDownCities> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return PageStateBuilder<CategoryModel>(
          init: const SizedBox.shrink(),
          success: widget.widget,
          loading: AppTextField(
            name: 'cities',
            hintText: LocaleKeys.add_post_screen_category.tr(),
            suffixIcon: LoadingIndicator(
              color: context.colorScheme.primary,
            ),
          ),
          error: (Exception? error) {
            return InkWell(
              onTap: () {
                context.read<SettingBloc>().add(GetCitiesEvent());
              },
              child: AppTextField(
                readOnly: true,
                name: 'cities',
                hintText: LocaleKeys.add_post_screen_category.tr(),
                suffixIcon: Icon(
                  Icons.error_outline,
                  size: 20,
                  color: context.colorScheme.error,
                ),
              ),
            );
          },
          result: state.citiesState,
          empty: const SizedBox.shrink(),
        );
      },
    );
  }
}
