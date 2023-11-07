import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/posts/data/model/city_model/city_model.dart';

import '../../../../core/common/model/page_state/result_builder.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../../app/presentation/widgets/loading_indicator.dart';
import '../bloc/home_bloc.dart';

class DropDownStore extends StatefulWidget {
  const DropDownStore({super.key, required this.widget});
  final Widget Function(StoreModel) widget;

  @override
  State<DropDownStore> createState() => _DropDownStoreState();
}

class _DropDownStoreState extends State<DropDownStore> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PageStateBuilder<StoreModel>(
          init: const SizedBox.shrink(),
          success: widget.widget,
          loading: AppTextField(
            name: 'store',
            hintText: LocaleKeys.add_post_screen_store.tr(),
            suffixIcon: LoadingIndicator(
              color: context.colorScheme.primary,
            ),
          ),
          error: (Exception? error) {
            return InkWell(
              onTap: () {
                context.read<HomeBloc>().add(GetStoreEvent());
              },
              child: AppTextField(
                readOnly: true,
                name: 'store',
                hintText: LocaleKeys.add_post_screen_store.tr(),
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  size: 20,
                  color: context.colorScheme.primary,
                ),
              ),
            );
          },
          result: state.storeStatus,
          empty: const Text('no Store'),
        );
      },
    );
  }
}
