import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/config/themes/app_theme.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/loading_indicator.dart';
import 'package:user/features/products/data/model/posts_model.dart';
import 'package:user/features/products/presintation/bloc/home_bloc.dart';
import 'package:user/features/products/presintation/pages/add_post_screen.dart';
import 'package:user/generated/locale_keys.g.dart';

class PopUpMenuDeleteEdit extends StatelessWidget {
  const PopUpMenuDeleteEdit({
    super.key,
    required this.deleteFunction,
    required this.fromContext,
    this.product,
    required this.isProduct,
    this.editFunction,
    required this.isCoupon,
  });

  final Function() deleteFunction;
  final BuildContext fromContext;
  final Data? product;
  final Function()? editFunction;
  final bool isProduct;
  final bool isCoupon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: context.colorScheme.primary,
        ),
        onSelected: (value) {
          if (value == Const.edit) {
            if (isProduct) {
              fromContext.goNamed(GRouter.config.homeScreen.addPostScreen,
                  extra:
                      AddPostScreenParams(isUpdate: true, postsModel: product));
            } else {
              print(true);
              editFunction!;
            }
          } else if (value == Const.delete) {
            Const.showMyDialog(
              isCoupon: isCoupon,
              context: context,
              title: isCoupon
                  ? LocaleKeys.coupon_delete_coupon.tr()
                  : LocaleKeys.home_screen_delete_post.tr(),
              content: isCoupon
                  ? LocaleKeys.coupon_sure_delete.tr()
                  : LocaleKeys.home_screen_sure_delete.tr(),
              onPressed: deleteFunction,
            );
          }
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
  static void showMyDialog(
          {required context,
          required String title,
          required String content,
          required dynamic Function()? onPressed,
          required bool isCoupon}) =>
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    title,
                    style: context.textTheme.titleMedium,
                  ),
                  elevation: 10,
                  content: Text(
                    content,
                    style: context.textTheme.titleSmall,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () =>
                                Navigator.pop(context, LocaleKeys.cancel.tr()),
                            child: Container(
                              padding: HWEdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: context.colorScheme.primary),
                                  borderRadius:
                                      BorderRadius.circular(kbrButton),
                                  color:
                                      context.colorScheme.secondaryContainer),
                              child: Text(
                                LocaleKeys.cancel.tr(),
                                style: context.textTheme.titleSmall!.copyWith(
                                    color: context.colorScheme.primary),
                              ),
                            )),
                        BlocSelector<HomeBloc, HomeState, BlocStatus>(
                          selector: (state) => isCoupon
                              ? state.deleteCouponStatus
                              : state.deletePostOrComment,
                          builder: (context, state) {
                            return ConditionalBuilder(
                              condition: !state.isLoading(),
                              fallback: (context) => const LoadingIndicator(),
                              builder: (context) => Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kbrButton),
                                    color: Colors.red),
                                child: MaterialButton(
                                    onPressed: onPressed,
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

  static String edit = LocaleKeys.edit.tr();
  static String delete = LocaleKeys.delete.tr();
  static List<String> chose = [edit, delete];
}
