import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/common/model/page_state/result_builder.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/features/app/presentation/widgets/app_text_view.dart';
import 'package:user/features/app/presentation/widgets/loading_indicator.dart';
import 'package:user/features/chat/data/model/chat_model/chats_model.dart';
import 'package:user/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:user/features/chat/presentation/widget/card_chat.dart';
import 'package:user/generated/locale_keys.g.dart';

class ChatSalesScreen extends StatelessWidget {
  const ChatSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      return PageStateBuilder<List<Data>>(
        init: const SizedBox.shrink(),
        success: (List<Data> data) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ChatBloc>().add(GetAllChatsEvent());
            },
            child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => CardChat(
                    chatId: data[index].id,
                    userPhoto: data[index].customer.photo,
                    userName: data[index].customer.name,
                    productTitle: data[index].product.title),
                separatorBuilder: (context, _) => const Divider(),
                itemCount: data.length),
          );
        },
        loading: const Center(
          child: LoadingIndicator(),
        ),
        error: (Exception? error) {
          return AppTextView(error.toString(),
              style: context.textTheme.titleLarge);
        },
        result: state.salesChat,
        empty: AppTextView(
          LocaleKeys.no_data.tr(),
          style: context.textTheme.titleLarge,
        ),
      );
    });
  }
}
