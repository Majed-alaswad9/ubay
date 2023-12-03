part of 'chat_bloc.dart';

@immutable
class ChatState {
  final PageState<ChatsModel> chatStatus;
  final PageState<List<Data>> salesChat;
  final PageState<List<Data>> purchasesChat;
  final PageState<MessagesModel> messageStatus;
  final BlocStatus sendMessageStatus;

  const ChatState(
      {this.chatStatus = const PageState.init(),
      this.sendMessageStatus = const BlocStatus.initial(),
      this.salesChat = const PageState.init(),
      this.purchasesChat = const PageState.init(),
      this.messageStatus = const PageState.init()});

  ChatState copyWith(
      {final PageState<ChatsModel>? chatStatus,
      final PageState<List<Data>>? salesChat,
      final PageState<List<Data>>? purchasesChat,
      final BlocStatus? sendMessageStatus,
      final PageState<MessagesModel>? messageStatus}) {
    return ChatState(
        chatStatus: chatStatus ?? this.chatStatus,
        salesChat: salesChat ?? this.salesChat,
        purchasesChat: purchasesChat ?? this.purchasesChat,
        sendMessageStatus: sendMessageStatus ?? this.sendMessageStatus,
        messageStatus: messageStatus ?? this.messageStatus);
  }
}
