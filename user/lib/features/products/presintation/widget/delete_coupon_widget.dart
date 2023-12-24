import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/util/extensions/build_context.dart';

import '../../../../core/common/model/page_state/bloc_status.dart';
import '../../../../core/config/themes/app_theme.dart';
import '../../../../core/util/responsive_padding.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/loading_indicator.dart';
import '../bloc/home_bloc.dart';

class DeleteCoupon extends StatelessWidget {
  const DeleteCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: context.colorScheme.primary,
        ),
        onSelected: (value) {
          if (value == delete) {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                        title: Text(
                          LocaleKeys.coupon_delete_coupon.tr(),
                          style: context.textTheme.titleSmall,
                        ),
                        elevation: 10,
                        content: Text(
                          LocaleKeys.coupon_sure_delete.tr(),
                          style: context.textTheme.bodyMedium,
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () => Navigator.pop(
                                      context, LocaleKeys.cancel.tr()),
                                  child: Container(
                                    padding: HWEdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: context.colorScheme.primary),
                                        borderRadius:
                                            BorderRadius.circular(kbrButton),
                                        color: context
                                            .colorScheme.secondaryContainer),
                                    child: Text(
                                      LocaleKeys.cancel.tr(),
                                      style: context.textTheme.titleSmall!
                                          .copyWith(
                                              color:
                                                  context.colorScheme.primary),
                                    ),
                                  )),
                              BlocSelector<HomeBloc, HomeState, BlocStatus>(
                                selector: (state) => state.deleteCouponStatus,
                                builder: (context, state) {
                                  return ConditionalBuilder(
                                    condition: !state.isLoading(),
                                    fallback: (context) =>
                                        const LoadingIndicator(),
                                    builder: (context) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(kbrButton),
                                          color: Colors.red),
                                      child: MaterialButton(
                                          onPressed: () {},
                                          child: Text(
                                            LocaleKeys.yes.tr(),
                                            style: context.textTheme.titleSmall!
                                                .copyWith(color: Colors.white),
                                          )),
                                    ),
                                  );
                                },
                              )
                            ],
                          )
                        ]));
          }
        },
        itemBuilder: (BuildContext context) {
          return _chose.map((e) {
            return PopupMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: context.textTheme.titleSmall,
                ));
          }).toList();
        });
  }

  static String delete = LocaleKeys.delete.tr();
  static final List<String> _chose = [delete];
}
