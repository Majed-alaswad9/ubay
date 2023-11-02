import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user/core/config/themes/typography.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/generated/locale_keys.g.dart';

class PopUpMenuBottom extends StatelessWidget {
  const PopUpMenuBottom({super.key, required this.deleteFunction});
  final Function() deleteFunction;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: context.colorScheme.primary,
        ),
        onSelected: (value) {
          if (value == Const.edit) {
            // navigatorPush(
            //     context: contexts,
            //     widget: EditPostScreen(
            //       id: feed.posts![index].sId!,
            //       content: feed.posts![index].content!,
            //     ));
          } else if (value == Const.delete) {
            Const.showMyDialog(
                context: context,
                title: LocaleKeys.delete_post.tr(),
                content: LocaleKeys.sure_delete.tr(),
                textButton_2: TextButton(
                    onPressed: deleteFunction,
                    child: Text(
                      LocaleKeys.yes.tr(),
                      style: context.textTheme.titleSmall.s13,
                    )));
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
          required TextButton textButton_2}) =>
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
                    textButton_2
                  ]));

  static String edit = LocaleKeys.edit.tr();
  static String delete = LocaleKeys.delete.tr();
  static List<String> chose = [edit, delete];
}
