import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/util/extensions/build_context.dart';

import '../../../../core/common/model/page_state/result_builder.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../../app/presentation/widgets/loading_indicator.dart';
import '../../data/model/category_model/category_model.dart';
import '../bloc/home_bloc.dart';

class DropDownCategory extends StatefulWidget {
  const DropDownCategory({super.key, required this.widget});
  final Widget Function(CategoryModel) widget;

  @override
  State<DropDownCategory> createState() => _DropDownCategoryState();
}

class _DropDownCategoryState extends State<DropDownCategory> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PageStateBuilder<CategoryModel>(
          init: const SizedBox.shrink(),
          success: widget.widget,
          loading: AppTextField(
            name: 'category',
            hintText: LocaleKeys.add_post_screen_category.tr(),
            suffixIcon: LoadingIndicator(
              color: context.colorScheme.primary,
            ),
          ),
          error: (Exception? error) {
            return InkWell(
              onTap: () {
                context.read<HomeBloc>().add(GetCategoryEvent());
              },
              child: AppTextField(
                readOnly: true,
                name: 'category',
                hintText: LocaleKeys.add_post_screen_category.tr(),
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  size: 20,
                  color: context.colorScheme.primary,
                ),
              ),
            );
          },
          result: state.categoryStatus,
          empty: const Text('no category'),
        );
      },
    );
  }
}
