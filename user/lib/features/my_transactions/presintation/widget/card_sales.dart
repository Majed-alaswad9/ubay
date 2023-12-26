import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/config/themes/my_color_scheme.dart';
import 'package:user/core/util/chose_date_time.dart';
import 'package:user/core/util/core_helper.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/my_transactions/data/model/sales_model/sales_model.dart';
import 'package:user/features/my_transactions/presintation/widget/photo_view.dart';
import 'package:user/generated/locale_keys.g.dart';
import '../../../../core/util/responsive_padding.dart';
import '../../../app/presentation/widgets/app_text_view.dart';

class ListTransactions extends StatelessWidget {
  const ListTransactions(
      {super.key,
      required this.title,
      required this.price,
      required this.photos,
      this.payment,
      required this.barcode,
      required this.header,
      required this.color,
      required this.iconColor,
      required this.iconData,
      required this.isReceive,
      this.sellerDate,
      this.customerDate,
      required this.productId});
  final String title;
  final String productId;
  final String header;
  final Color color;
  final Color iconColor;
  final IconData iconData;
  final int price;
  final List<String> photos;
  final Payment? payment;
  final bool barcode;
  final bool isReceive;
  final DateTime? sellerDate;
  final DateTime? customerDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Padding(
        padding: HWEdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              color: color,
              child: Row(
                children: [
                  Icon(
                    iconData,
                    color: iconColor,
                  ),
                  10.horizontalSpace,
                  AppTextView(
                    header,
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: AppTextView(title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleMedium),
                    ),
                    10.verticalSpace,
                    Row(children: [
                      AppTextView(LocaleKeys.home_screen_price.tr(),
                          style: context.textTheme.bodyMedium),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                        child: AppTextView(
                            '${CoreHelper.handlePrice(CoreHelper.formatter.format(price))} ل س',
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyMedium!
                                .copyWith(color: context.colorScheme.primary)),
                      )
                    ]),
                    if (sellerDate != null) ...[
                      10.verticalSpace,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.49,
                        child: AppTextView(
                            '${LocaleKeys.date_seller_date.tr()} ${ChoseDateTime().chose(sellerDate!)}',
                            style: context.textTheme.bodyMedium!
                                .copyWith(color: context.colorScheme.grey)),
                      ),
                    ],
                    if (customerDate != null) ...[
                      10.verticalSpace,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.49,
                        child: AppTextView(
                            '${LocaleKeys.date_customer_date.tr()} ${ChoseDateTime().chose(customerDate!)}',
                            style: context.textTheme.bodyMedium!
                                .copyWith(color: context.colorScheme.grey)),
                      ),
                    ],
                    10.verticalSpace,
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            print(productId);
                            context.pushNamed(
                                GRouter.config.homeRoutes.viewProductScreen,
                                extra: productId);
                          },
                          child: Container(
                              padding: HWEdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: context.colorScheme.secondary,
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  LocaleKeys.home_screen_details.tr(),
                                  style: context.textTheme.titleSmall!.copyWith(
                                      color: context.colorScheme.secondary,
                                      fontSize: 12),
                                ),
                              )),
                        ),
                        if (barcode) ...[
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              final qr = QrImageView(
                                data:
                                    '{"isDeliver":"${!isReceive}" ,"product": "$productId","payment":"${payment!.id}"}',
                                version: QrVersions.auto,
                                size: 200.0,
                              );
                              showModalBottomSheet(
                                  isScrollControlled: false,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(12))),
                                  builder: (context) => SizedBox(
                                      width: double.infinity,
                                      child: Center(
                                          child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AppTextView(
                                              isReceive
                                                  ? '${LocaleKeys.receive_the_product.tr()} $title'
                                                  : '${LocaleKeys.delivery_of_the_product.tr()} $title',
                                              style: context
                                                  .textTheme.titleLarge!
                                                  .copyWith(
                                                      color: context.colorScheme
                                                          .primary)),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          qr,
                                        ],
                                      ))));
                            },
                            child: Container(
                              padding: HWEdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: context.colorScheme.primary),
                              child: Row(
                                children: [
                                  Text(
                                    LocaleKeys.home_screen_generate_qr.tr(),
                                    style: context.textTheme.titleSmall!
                                        .copyWith(
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
                            ),
                          ),
                        ]
                      ],
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 180,
                  width: 180,
                  child: PhotoView(
                    imageUrls: photos,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
