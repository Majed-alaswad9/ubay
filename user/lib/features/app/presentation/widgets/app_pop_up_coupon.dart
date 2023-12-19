import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_elevated_button.dart';
import 'package:user/features/app/presentation/widgets/app_text_field.dart';
import 'package:user/generated/locale_keys.g.dart';

class PopUpMenuCoupon extends StatefulWidget {
  PopUpMenuCoupon(
      {super.key,
      required this.title,
      this.expire,
      this.discount,
      required this.context,
      required this.userPhoto,
      required this.userName,
      required this.priceProduct});

  final BuildContext context;
  final String title;
  final String userPhoto;
  final String userName;
  final int priceProduct;
  DateTime? expire;
  int? discount;

  @override
  State<PopUpMenuCoupon> createState() => _PopUpMenuCouponState();
}

class _PopUpMenuCouponState extends State<PopUpMenuCoupon> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  int price = 0;
  @override
  void initState() {
    textEditingController.text =
        widget.discount != null ? widget.discount.toString() : '';
    dateInput.text = widget.expire != null
        ? DateFormat('yyyy-MM-dd').format(widget.expire!)
        : '';
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
              builder: (BuildContext context) => AlertDialog(
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
                            },
                            labelTextStyle: context.textTheme.titleSmall!
                                .copyWith(color: context.colorScheme.primary),
                          ),
                          Text(
                            '${LocaleKeys.coupon_the_price_will_be_after_discount.tr()} ${widget.priceProduct - price} ل س',
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
                          child: Text(LocaleKeys.add.tr()),
                        )
                      ]));
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
