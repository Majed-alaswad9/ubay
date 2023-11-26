import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/responsive_padding.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/chat/presentation/pages/messages_screen.dart';

class CardChat extends StatelessWidget {
  const CardChat(
      {super.key,
      required this.userPhoto,
      required this.userName,
      required this.productTitle,
      required this.chatId});
  final String userPhoto;
  final String userName;
  final String productTitle;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MessagesScreen(chatId: chatId)));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundImage: NetworkImage(userPhoto),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextView(userName, style: context.textTheme.titleMedium),
                //   const Spacer(),
                AppTextView(productTitle,
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
