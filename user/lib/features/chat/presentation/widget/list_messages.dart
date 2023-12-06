import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/stream_socket.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/chat/data/model/chat_model/chats_model.dart';
import 'package:user/features/chat/domain/usecase/add_message_use_case.dart';

import '../../../../core/common/model/page_state/bloc_status.dart';
import '../../../../core/common/model/page_state/result_builder.dart';
import '../../../../core/util/responsive_padding.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../../app/presentation/widgets/app_text_view.dart';
import '../../../app/presentation/widgets/loading_indicator.dart';
import 'align_message_widget.dart';
import '../../data/model/messages_model/messages_model.dart';
import '../bloc/chat_bloc.dart';

// ignore: must_be_immutable
class ListMessages extends StatelessWidget {
  ListMessages(
      {super.key,
      required this.streamSocket,
      required this.product,
      required this.user2,
      required this.user,
      required this.socket,
      required this.chatId});
  final StreamSocket streamSocket;
  final Product product;
  final Customer user2;
  final UserModel user;
  final IO.Socket socket;
  final String chatId;

  late List<DataMessage> messages;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool isSuccess = false;
  jumpTo() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastOutSlowIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.all(10.0),
      child: StreamBuilder<Map<String, dynamic>>(
          stream: streamSocket.getResponse,
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            return Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.74,
                child: ListView(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: HWEdgeInsets.all(10),
                        color: Colors.grey.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 75,
                              backgroundImage: NetworkImage(product.photos[0]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppTextView(product.title,
                                style: context.textTheme.titleMedium),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  LocaleKeys.home_screen_view_post.tr(),
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          decoration: TextDecoration.underline,
                                          color: context.colorScheme.primary),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocConsumer<ChatBloc, ChatState>(
                        listener: (context, state) {
                          if (state.sendMessageStatus.isSuccess()) {
                            socket.emit('new message', {
                              'chatId': chatId,
                              'message': state.dataMessage!.toJson()
                            });
                            print(messages.length);
                            messageController.text = '';
                            isSuccess = true;
                          }
                        },
                        builder: (context, state) {
                          return PageStateBuilder<MessagesModel>(
                              init: const SizedBox.shrink(),
                              success: (data) {
                                if (!snapshot.hasData) {
                                  messages = data.data.reversed.toList();
                                }
                                if (snapshot.hasData) {
                                  messages.add(DataMessage.fromJson(
                                      snapshot.data!['newMessageReceived']));
                                }
                                if (isSuccess) {
                                  messages.add(state.dataMessage!);
                                  isSuccess = false;
                                }
                                jumpTo();
                                return ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          if (messages[index].user == user.id)
                                            alignMessage(
                                                context: context,
                                                borderRadius:
                                                    const BorderRadiusDirectional
                                                        .only(
                                                        bottomEnd: Radius
                                                            .circular(10.0),
                                                        topStart:
                                                            Radius.circular(
                                                                10.0),
                                                        topEnd: Radius.circular(
                                                            10.0)),
                                                message:
                                                    messages[index].content,
                                                color:
                                                    context.colorScheme.primary,
                                                alignment: AlignmentDirectional
                                                    .centerStart),
                                          if (messages[index].user == user2.id)
                                            alignMessage(
                                              context: context,
                                              message: messages[index].content,
                                              messageColor: Colors.black,
                                              color: Colors.grey.shade300,
                                              borderRadius:
                                                  const BorderRadiusDirectional
                                                      .only(
                                                      bottomStart:
                                                          Radius.circular(10.0),
                                                      topStart:
                                                          Radius.circular(10.0),
                                                      topEnd: Radius.circular(
                                                          10.0)),
                                            )
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, _) =>
                                        const SizedBox(
                                          height: 5,
                                        ),
                                    itemCount: messages.length);
                              },
                              loading: const Center(child: LoadingIndicator()),
                              error: (error) {
                                return const SizedBox.shrink();
                              },
                              result: state.messageStatus,
                              empty: Center(
                                child: Text(LocaleKeys.no_data.tr()),
                              ));
                        },
                      ),
                    ]),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      child: AppTextField(
                    name: 'send',
                    controller: messageController,
                    hintText: LocaleKeys.home_screen_write_message.tr(),
                  )),
                  //const Spacer(),
                  BlocSelector<ChatBloc, ChatState, BlocStatus>(
                      selector: (state) => state.sendMessageStatus,
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: !state.isLoading(),
                          builder: (context) => IconButton(
                              onPressed: () {
                                if (messageController.text.isNotEmpty) {
                                  context.read<ChatBloc>().add(AddMessageEvent(
                                      AddMessageParams(chatId,
                                          messageController.text, user.id)));
                                }
                              },
                              icon: Icon(
                                Icons.send,
                                color: context.colorScheme.primary,
                              )),
                          fallback: (context) =>
                              LoadingIndicator(dimension: 20.r),
                        );
                      })
                ],
              )
            ]);
          }),
    );
  }
}
