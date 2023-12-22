import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_pop_up_edit_delete.dart';
import 'package:user/features/app/presentation/widgets/app_text_field.dart';
import 'package:user/features/products/data/model/coupon_model/coupon_model.dart';

import '../../../../core/common/model/page_state/bloc_status.dart';
import '../../../../core/common/model/page_state/result_builder.dart';
import '../../../../core/config/themes/app_theme.dart';
import '../../../../core/util/chose_date_time.dart';
import '../../../../core/util/responsive_padding.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_elevated_button.dart';
import '../../../app/presentation/widgets/app_text_view.dart';
import '../../../app/presentation/widgets/loading_indicator.dart';
import '../bloc/home_bloc.dart';

class ButtonCoupon extends StatefulWidget {
  const ButtonCoupon({super.key, required this.price, required this.id});
  final int price;
  final String id;

  @override
  State<ButtonCoupon> createState() => _ButtonCouponState();
}

class _ButtonCouponState extends State<ButtonCoupon> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  late ValueNotifier<CouponModel> couponNotifier;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: context.colorScheme.primary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kbrButton)),
      onPressed: () {
        context.read<HomeBloc>().add(GetCouponsEvent(id: widget.id));
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            builder: (context) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.80,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return PageStateBuilder(
                          init: const SizedBox.shrink(),
                          success: (data) {
                            return ValueListenableBuilder(
                                valueListenable: couponNotifier,
                                builder: (context, obscure, _) {
                                  return ListView.separated(
                                      itemBuilder: (context, index) => Card(
                                          margin: HWEdgeInsets.symmetric(
                                              horizontal: 10),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Padding(
                                            padding: HWEdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(data
                                                              .data[index]
                                                              .user
                                                              .photo),
                                                    ),
                                                    10.horizontalSpace,
                                                    Column(
                                                      children: [
                                                        AppTextView(
                                                            data.data[index]
                                                                .user.name,
                                                            style: context
                                                                .textTheme
                                                                .titleMedium),
                                                        10.verticalSpace,
                                                        AppTextView(
                                                            ChoseDateTime()
                                                                .chose(data
                                                                    .data[index]
                                                                    .createdAt),
                                                            style: context
                                                                .textTheme
                                                                .bodyMedium!
                                                                .withColor(
                                                                    Colors
                                                                        .grey))
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    PopUpMenuDeleteEdit(
                                                      deleteFunction: () {
                                                        context
                                                            .read<HomeBloc>()
                                                            .add(DeleteCouponEvent(
                                                                data.data[index]
                                                                    .id));
                                                      },
                                                      fromContext: context,
                                                      isProduct: false,
                                                      isCoupon: true,
                                                    )
                                                  ],
                                                ),
                                                10.verticalSpace,
                                                Row(
                                                  children: [
                                                    AppTextView(
                                                        LocaleKeys
                                                            .coupon_discount
                                                            .tr(),
                                                        style: context.textTheme
                                                            .titleMedium!
                                                            .withColor(context
                                                                .colorScheme
                                                                .secondary)),
                                                    const Spacer(),
                                                    AppTextView(
                                                        '${data.data[index].discount} ل س',
                                                        style: context.textTheme
                                                            .titleMedium!
                                                            .withColor(context
                                                                .colorScheme
                                                                .primary))
                                                  ],
                                                ),
                                                10.verticalSpace,
                                                Row(
                                                  children: [
                                                    AppTextView(
                                                        LocaleKeys
                                                            .coupon_the_price_after_discount
                                                            .tr(),
                                                        style: context.textTheme
                                                            .titleMedium!
                                                            .withColor(context
                                                                .colorScheme
                                                                .secondary)),
                                                    const Spacer(),
                                                    AppTextView(
                                                        '${widget.price - data.data[index].discount} ل س',
                                                        style: context.textTheme
                                                            .titleMedium!
                                                            .withColor(context
                                                                .colorScheme
                                                                .primary))
                                                  ],
                                                ),
                                                10.verticalSpace,
                                                Row(
                                                  children: [
                                                    AppTextView(
                                                        LocaleKeys
                                                            .coupon_end_of_validity
                                                            .tr(),
                                                        style: context.textTheme
                                                            .titleMedium!
                                                            .withColor(context
                                                                .colorScheme
                                                                .secondary)),
                                                    const Spacer(),
                                                    AppTextView(
                                                        data.data[index]
                                                                    .expire !=
                                                                null
                                                            ? '${data.data[index].expire!.day}-${data.data[index].expire!.month}-${data.data[index].expire!.year}'
                                                            : LocaleKeys
                                                                .not_found
                                                                .tr(),
                                                        style: context.textTheme
                                                            .titleMedium!
                                                            .withColor(context
                                                                .colorScheme
                                                                .primary))
                                                  ],
                                                )
                                              ],
                                            ),
                                          )),
                                      separatorBuilder: (context, _) =>
                                          5.verticalSpace,
                                      itemCount: data.data.length);
                                });
                          },
                          loading: const Center(
                            child: LoadingIndicator(),
                          ),
                          error: (message) {
                            return AppTextView(message.toString(),
                                style: context.textTheme.titleMedium);
                          },
                          result: state.couponsStatus,
                          empty: AppTextView(
                            LocaleKeys.no_data.tr(),
                            style: context.textTheme.titleMedium,
                          ));
                    },
                  ),
                ));
      },
      child: Text(
        LocaleKeys.coupon_view_coupons.tr(),
        style: context.textTheme.titleSmall!.withColor(Colors.white),
      ),
    );
  }
}
