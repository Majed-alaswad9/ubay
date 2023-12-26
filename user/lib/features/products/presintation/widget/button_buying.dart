import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';

import '../../../../core/common/model/page_state/bloc_status.dart';
import '../../../../core/config/themes/app_theme.dart';
import '../../../../core/util/responsive_padding.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_elevated_button.dart';
import '../../../app/presentation/widgets/app_text_view.dart';
import '../bloc/home_bloc.dart';

class ButtonBuying extends StatelessWidget {
  const ButtonBuying({super.key, required this.id, required this.price});
  final String id;
  final int price;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: context.colorScheme.primary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kbrButton)),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            builder: (context) => Padding(
                  padding: HWEdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextView(LocaleKeys.payment_lbl_first.tr(),
                          style: context.textTheme.titleMedium),
                      5.verticalSpace,
                      AppTextView(LocaleKeys.payment_lbl_second.tr(),
                          style: context.textTheme.titleMedium),
                      20.verticalSpace,
                      AppTextView(
                          '${LocaleKeys.home_screen_price.tr()} $price ل س',
                          style: context.textTheme.titleMedium),
                      20.verticalSpace,
                      BlocSelector<HomeBloc, HomeState, BlocStatus>(
                        selector: (state) => state.addPaymentStatus,
                        builder: (context, state) {
                          return AppElevatedButton(
                            isLoading: state.isLoading(),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.shopping_cart_checkout_outlined,
                                  color: Colors.white,
                                ),
                                5.horizontalSpace,
                                AppTextView(LocaleKeys.payment_buy.tr(),
                                    style: context.textTheme.titleMedium!
                                        .withColor(Colors.white))
                              ],
                            ),
                            onPressed: () {
                              context.read<HomeBloc>().add(AddPaymentEvent(id));
                            },
                          );
                        },
                      )
                    ],
                  ),
                ));
      },
      child: Row(
        children: [
          const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          5.horizontalSpace,
          Text(
            '$price ل س',
            style: context.textTheme.titleSmall!.withColor(Colors.white),
          )
        ],
      ),
    );
  }
}
