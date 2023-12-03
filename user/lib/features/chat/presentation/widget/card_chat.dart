import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_pop_up_edit_delete.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/chat/data/model/chat_model/chats_model.dart';
import 'package:user/features/chat/presentation/pages/messages_screen.dart';

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
          Const.showMyDialog(
              context: context,
              title: 'delete',
              content: 'delete this chat with ${user.name}',
              onPressed: () {});
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
}
