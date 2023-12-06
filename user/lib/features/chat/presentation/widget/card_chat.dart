import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_pop_up_edit_delete.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/chat/data/model/chat_model/chats_model.dart';
import 'package:user/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:user/features/chat/presentation/pages/messages_screen.dart';
import 'package:user/generated/locale_keys.g.dart';

import '../../../../core/common/model/page_state/bloc_status.dart';
import '../../../app/presentation/widgets/loading_indicator.dart';

class CardChat extends StatelessWidget {
  const CardChat(
      {super.key,
      required this.user,
      required this.product,
      required this.chatId});
  final Customer user;
  final Product product;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: InkWell(
        onLongPress: () {
          showMyDialog(
              context: context,
              title: LocaleKeys.delete.tr(),
              content: '${LocaleKeys.delete_this_chat.tr()} ${user.name}',
              onPressed: () {
                context.read<ChatBloc>().add(DeleteChatEvent(chatId));
              });
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MessagesScreen(
                      params: MessagesParams(
                          product: product, user2: user, chatId: chatId))));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundImage: NetworkImage(user.photo),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextView(user.name, style: context.textTheme.titleMedium),
                //   const Spacer(),
                AppTextView(product.title,
                    style: context.textTheme.titleSmall!
                        .copyWith(color: Colors.grey))
              ],
            )
          ],
        ),
      ),
    );
  }

  void showMyDialog(
          {required context,
          required String title,
          required String content,
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
                        child: Container(
                          padding: HWEdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: context.colorScheme.primary),
                              borderRadius: BorderRadius.circular(16),
                              color: context.colorScheme.secondaryContainer),
                          child: Text(
                            LocaleKeys.cancel.tr(),
                            style: context.textTheme.titleSmall!
                                .copyWith(color: context.colorScheme.primary),
                          ),
                        )),
                    BlocSelector<ChatBloc, ChatState, BlocStatus>(
                      selector: (state) => state.deleteChat,
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: !state.isLoading(),
                          fallback: (context) => const LoadingIndicator(),
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
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
                  ]));
}
