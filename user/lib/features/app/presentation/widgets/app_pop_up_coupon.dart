import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/config/themes/app_theme.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_text_field.dart';
import 'package:user/features/products/domain/usecases/coupons_use_case/add_coupon_use_case.dart';
import 'package:user/features/products/presintation/bloc/home_bloc.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../../core/util/responsive_padding.dart';
import 'loading_indicator.dart';

class PopUpMenuCoupon extends StatefulWidget {
  const PopUpMenuCoupon(
      {super.key,
      required this.title,
      required this.userPhoto,
      required this.userName,
      required this.priceProduct,
      required this.productId,
      required this.userId});
  final String productId;
  final String userId;
  final String title;
  final String userPhoto;
  final String userName;
  final int priceProduct;

  @override
  State<PopUpMenuCoupon> createState() => _PopUpMenuCouponState();
}

class _PopUpMenuCouponState extends State<PopUpMenuCoupon> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  late ValueNotifier<int> currentPrice;
  String? expire;
  int price = 0;
  @override
  void initState() {
    currentPrice = ValueNotifier(widget.priceProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: context.colorScheme.primary,
        ),
        onSelected: (value) {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => ValueListenableBuilder(
                  valueListenable: currentPrice,
                  builder: (context, obscureValue, _) {
                    return AlertDialog(
                        title: Text(
                          widget.title,
                          style: context.textTheme.titleMedium!
                              .copyWith(color: context.colorScheme.primary),
                        ),
                        elevation: 10,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                LocaleKeys
                                    .coupon_the_user_who_will_receive_the_discount
                                    .tr(),
                                style: context.textTheme.titleSmall),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              color: context.colorScheme.secondaryContainer,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(widget.userPhoto),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.userName,
                                      style: context.textTheme.titleSmall,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              name: 'coupon',
                              controller: textEditingController,
                              textInputType: TextInputType.number,
                              labelText: LocaleKeys.coupon_discount.tr(),
                              onChange: (value) {
                                price = int.parse(value.toString());
                                currentPrice.value =
                                    widget.priceProduct - price;
                              },
                              labelTextStyle: context.textTheme.titleSmall!
                                  .copyWith(color: context.colorScheme.primary),
                            ),
                            Text(
                              obscureValue > 0
                                  ? '${LocaleKeys.coupon_the_price_will_be_after_discount.tr()} $obscureValue ل س'
                                  : 'لايمكن اضافة هذا الحسم لانه اكبر من سعر المنتج',
                              style: context.textTheme.bodySmall,
                            ),
                            10.verticalSpace,
                            AppTextField(
                              name: 'date',
                              controller: dateInput,
                              labelText: LocaleKeys.coupon_end_of_validity.tr(),
                              labelTextStyle: context.textTheme.titleSmall!
                                  .copyWith(color: context.colorScheme.primary),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    //DateTime.now() - not to allow to choose before today.
                                    initialDate: DateTime.now(),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          colorScheme: const ColorScheme.light()
                                              .copyWith(
                                            primary:
                                                context.colorScheme.primary,
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  final formatDate = DateFormat('yyyy/MM/dd')
                                      .format(pickedDate);
                                  setState(() {
                                    expire = pickedDate.toString();
                                    print('expire: $expire');
                                    dateInput.text =
                                        formatDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                              suffixIcon: Icon(
                                Icons.calendar_today,
                                color: context.colorScheme.primary,
                              ),
                            )
                          ],
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
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
                                selector: (state) => state.addCouponStatus,
                                builder: (context, state) {
                                  return ConditionalBuilder(
                                    condition: !state.isLoading(),
                                    fallback: (context) =>
                                        const LoadingIndicator(),
                                    builder: (context) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(kbrButton),
                                          color: context.colorScheme.primary),
                                      child: MaterialButton(
                                          onPressed: () {
                                            if (price < widget.priceProduct &&
                                                price > 0) {
                                              context.read<HomeBloc>().add(
                                                  AddCouponEvent(
                                                      AddCouponParams(
                                                          widget.userId,
                                                          widget.productId,
                                                          price,
                                                          expire)));
                                            }
                                          },
                                          child: Text(
                                            LocaleKeys.add.tr(),
                                            style: context.textTheme.titleSmall!
                                                .copyWith(color: Colors.white),
                                          )),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ]);
                  }));
        },
        itemBuilder: (BuildContext context) {
          return Const.chose.map((e) {
            return PopupMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: context.textTheme.titleSmall,
                ));
          }).toList();
        });
  }
}

class Const {
  static String addCoupon = 'اضافة حسم للمستخدم';
  static List<String> chose = [addCoupon];
}
