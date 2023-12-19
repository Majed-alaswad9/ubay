import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_pop_up_edit_delete.dart';
import 'package:user/features/app/presentation/widgets/app_text_field.dart';

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
                            return ListView.separated(
                                itemBuilder: (context, index) => Card(
                                    margin:
                                        HWEdgeInsets.symmetric(horizontal: 10),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: HWEdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    data.data[index].user
                                                        .photo),
                                              ),
                                              10.horizontalSpace,
                                              Column(
                                                children: [
                                                  AppTextView(
                                                      data.data[index].user
                                                          .name,
                                                      style: context.textTheme
                                                          .titleMedium),
                                                  10.verticalSpace,
                                                  AppTextView(
                                                      ChoseDateTime().chose(data
                                                          .data[index]
                                                          .createdAt),
                                                      style: context
                                                          .textTheme.bodyMedium!
                                                          .withColor(
                                                              Colors.grey))
                                                ],
                                              ),
                                              const Spacer(),
                                              PopUpMenuDeleteEdit(
                                                deleteFunction: () {},
                                                editFunction: () {
                                                  showMyDialog(
                                                      context,
                                                      'edit coupon',
                                                      data.data[index].user
                                                          .photo,
                                                      data.data[index].user
                                                          .name,
                                                      widget.price,
                                                      data.data[index].discount,
                                                      expire: data
                                                          .data[index].expire);
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
                                                  LocaleKeys.coupon_discount
                                                      .tr(),
                                                  style: context
                                                      .textTheme.titleMedium!
                                                      .withColor(context
                                                          .colorScheme
                                                          .secondary)),
                                              const Spacer(),
                                              AppTextView(
                                                  '${data.data[index].discount} ل س',
                                                  style: context
                                                      .textTheme.titleMedium!
                                                      .withColor(context
                                                          .colorScheme.primary))
                                            ],
                                          ),
                                          10.verticalSpace,
                                          Row(
                                            children: [
                                              AppTextView('السعر بعد الحسم',
                                                  style: context
                                                      .textTheme.titleMedium!
                                                      .withColor(context
                                                          .colorScheme
                                                          .secondary)),
                                              const Spacer(),
                                              AppTextView(
                                                  '${widget.price - data.data[index].discount} ل س',
                                                  style: context
                                                      .textTheme.titleMedium!
                                                      .withColor(context
                                                          .colorScheme.primary))
                                            ],
                                          ),
                                          10.verticalSpace,
                                          Row(
                                            children: [
                                              AppTextView('الانتهاء',
                                                  style: context
                                                      .textTheme.titleMedium!
                                                      .withColor(context
                                                          .colorScheme
                                                          .secondary)),
                                              const Spacer(),
                                              AppTextView(
                                                  data.data[index].expire !=
                                                          null
                                                      ? '${data.data[index].expire!.day}-${data.data[index].expire!.month}-${data.data[index].expire!.year}'
                                                      : 'not found',
                                                  style: context
                                                      .textTheme.titleMedium!
                                                      .withColor(context
                                                          .colorScheme.primary))
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                                separatorBuilder: (context, _) =>
                                    5.verticalSpace,
                                itemCount: data.data.length);
                          },
                          loading: const Center(
                            child: LoadingIndicator(),
                          ),
                          error: (message) {
                            return AppTextView(message.toString(),
                                style: context.textTheme.titleMedium);
                          },
                          result: state.couponsState,
                          empty: AppTextView(
                            LocaleKeys.no_data.tr(),
                            style: context.textTheme.titleMedium,
                          ));
                    },
                  ),
                ));
      },
      child: Text(
        'view coupons',
        style: context.textTheme.titleSmall!.withColor(Colors.white),
      ),
    );
  }

  showMyDialog(BuildContext context, String title, String userPhoto,
          String userName, int priceProduct, int discount,
          {DateTime? expire}) =>
      showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            dateInput.text = discount.toString();
            int price = 0;
            return AlertDialog(
                title: Text(
                  title,
                  style: context.textTheme.titleMedium!
                      .copyWith(color: context.colorScheme.primary),
                ),
                elevation: 10,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        LocaleKeys.coupon_the_user_who_will_receive_the_discount
                            .tr(),
                        style: context.textTheme.titleSmall),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(userPhoto),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              userName,
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
                      },
                      labelTextStyle: context.textTheme.titleSmall!
                          .copyWith(color: context.colorScheme.primary),
                    ),
                    Text(
                      '${LocaleKeys.coupon_the_price_will_be_after_discount.tr()} ${priceProduct - price} ل س',
                      style: context.textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                            firstDate: DateTime(DateTime.now().day),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
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
                  AppElevatedButton(
                    onPressed: () {},
                    child: Text(LocaleKeys.save.tr()),
                  )
                ]);
          });
}
