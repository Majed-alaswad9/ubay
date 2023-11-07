import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_elevated_button.dart';
import 'package:user/features/posts/data/model/posts_model.dart';
import 'package:user/features/posts/presintation/bloc/home_bloc.dart';
import 'package:user/features/posts/presintation/pages/add_post_screen.dart';
import 'package:user/generated/locale_keys.g.dart';

class PopUpMenuDeleteEdit extends StatelessWidget {
  const PopUpMenuDeleteEdit(
      {super.key,
      required this.deleteFunction,
      required this.fromContext,
      this.product,
      required this.isProduct,
      required this.blocStatus});

  final Function() deleteFunction;
  final BuildContext fromContext;
  final BlocStatus blocStatus;
  final Data? product;
  final bool isProduct;

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
            }
          } else if (value == Const.delete) {
            Const.showMyDialog(
                context: context,
                title: LocaleKeys.delete_post.tr(),
                content: LocaleKeys.sure_delete.tr(),
                blocStatus: blocStatus,
                onPressed: deleteFunction);
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
          required BlocStatus blocStatus,
          required dynamic Function()? onPressed}) =>
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
                    TextButton(
                        onPressed: () =>
                            Navigator.pop(context, LocaleKeys.cancel.tr()),
                        child: Text(
                          LocaleKeys.cancel.tr(),
                          style: context.textTheme.titleSmall.s13,
                        )),
                    BlocSelector<HomeBloc, HomeState, BlocStatus>(
                      selector: (state) => blocStatus,
                      builder: (context, state) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red),
                          child: MaterialButton(
                              onPressed: onPressed,
                              child: Text(
                                LocaleKeys.yes.tr(),
                                style: context.textTheme.titleSmall.s13,
                              )),
                        );
                      },
                    )
                  ]));

  static String edit = LocaleKeys.edit.tr();
  static String delete = LocaleKeys.delete.tr();
  static List<String> chose = [edit, delete];
}
