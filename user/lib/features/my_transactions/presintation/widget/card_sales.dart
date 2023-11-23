import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/my_transactions/data/model/sales_model/sales_model.dart';
import 'package:user/features/my_transactions/presintation/widget/photo_view.dart';
import 'package:user/features/products/data/model/posts_model.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../../core/util/responsive_padding.dart';
import '../../../../generated/assets.dart';
import '../../../app/presentation/widgets/app_svg_picture.dart';
import '../../../app/presentation/widgets/app_text_view.dart';

class CardSales extends StatelessWidget {
  const CardSales(
      {super.key,
      required this.title,
      required this.price,
      required this.photos,
      this.payment,
      this.coupons,
      required this.wait});
  final String title;
  final int price;
  final List<String> photos;
  final Payment? payment;
  final bool wait;
  final Coupons? coupons;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Padding(
        padding: HWEdgeInsets.only(right: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextView(title,
                    overflow: TextOverflow.visible,
                    style: context.textTheme.titleLarge),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    AppTextView(LocaleKeys.price.tr(),
                        style: context.textTheme.titleMedium),
                    AppTextView(price.toString(),
                        style: context.textTheme.titleSmall!
                            .copyWith(color: context.colorScheme.primary))
                  ],
                ),
                if (coupons != null) ...[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      AppTextView(LocaleKeys.price.tr(),
                          style: context.textTheme.titleMedium),
                      AppTextView(price.toString(),
                          style: context.textTheme.titleSmall!
                              .copyWith(color: context.colorScheme.primary))
                    ],
                  ),
                ],
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                          padding: HWEdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: context.colorScheme.secondary,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Text(
                              LocaleKeys.details.tr(),
                              style: context.textTheme.titleSmall!.copyWith(
                                  color: context.colorScheme.secondary,
                                  fontSize: 12),
                            ),
                          )),
                    ),
                    if (wait) ...[
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: HWEdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: context.colorScheme.primary),
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.generate_qr.tr(),
                              style: context.textTheme.titleSmall!.copyWith(
                                  color: context.colorScheme.white,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.qr_code,
                              color: Colors.white,
                              size: 18,
                            )
                          ],
                        ),
                      )
                    ]
                  ],
                )
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: PhotoView(
              imageUrls: photos,
            ))
          ],
        ),
      ),
    );
  }
}
