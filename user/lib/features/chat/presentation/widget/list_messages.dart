import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/core/util/extensions/build_context.dart';
import 'package:user/core/util/stream_socket.dart';
import 'package:user/features/auth/data/model/login_model/login_model.dart';
import 'package:user/features/chat/data/model/chat_model/chats_model.dart';

import '../../../../core/common/model/page_state/bloc_status.dart';
import '../../../../core/common/model/page_state/result_builder.dart';
import '../../../../core/util/responsive_padding.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../../app/presentation/widgets/app_text_view.dart';
import '../../../app/presentation/widgets/loading_indicator.dart';
import '../../data/model/messages_model/messages_model.dart';
import '../bloc/chat_bloc.dart';

class ListMessages extends StatelessWidget {
  ListMessages(
      {super.key,
      required this.streamSocket,
      required this.product,
      required this.user2,
      required this.user});
  final StreamSocket streamSocket;
  final Product product;
  final Customer user2;
  final LoginModel user;

  late List<DataMessage> messages;
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
  final TextEditingController messageController = TextEditingController();
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
                                  'view product',
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
                      BlocBuilder<ChatBloc, ChatState>(
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
                                return ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          if (messages[index].user ==
                                              user.user.id)
                                            Align(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              child: Container(
                                                padding: HWEdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: context
                                                        .colorScheme.primary,
                                                    borderRadius:
                                                        const BorderRadiusDirectional
                                                            .only(
                                                            bottomEnd: Radius
                                                                .circular(10.0),
                                                            topStart:
                                                                Radius.circular(
                                                                    10.0),
                                                            topEnd:
                                                                Radius.circular(
                                                                    10.0))),
                                                child: AppTextView(
                                                  messages[index].content,
                                                  style: context
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          if (messages[index].user == user2.id)
                                            Align(
                                              alignment: AlignmentDirectional
                                                  .centerEnd,
                                              child: Container(
                                                padding: HWEdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                    borderRadius:
                                                        const BorderRadiusDirectional
                                                            .only(
                                                            bottomStart: Radius
                                                                .circular(10.0),
                                                            topStart:
                                                                Radius.circular(
                                                                    10.0),
                                                            topEnd:
                                                                Radius.circular(
                                                                    10.0))),
                                                child: AppTextView(
                                                  messages[index].content,
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                              ),
                                            ),
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
                    child: FormBuilder(
                      key: _formkey,
                      child: AppTextField(
                        name: 'send',
                        controller: messageController,
                        hintText: 'write message',
                      ),
                    ),
                  ),
                  //const Spacer(),
                  BlocSelector<ChatBloc, ChatState, BlocStatus>(
                      selector: (state) => state.sendMessageStatus,
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: !state.isLoading(),
                          builder: (context) => IconButton(
                              onPressed: () {
                                _formkey.currentState!.save();
                                _formkey.currentState!.validate();
                                if (_formkey.currentState!.isValid) {}
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
