part of 'chat_bloc.dart';

@immutable
class ChatState {
  final PageState<ChatsModel> chatStatus;
  final PageState<List<Data>> salesChat;
  final PageState<List<Data>> purchasesChat;
  final PageState<MessagesModel> messageStatus;
  final BlocStatus sendMessageStatus;
  final BlocStatus deleteMessage;
  final BlocStatus deleteChat;
  DataMessage? dataMessage;

  ChatState(
      {this.chatStatus = const PageState.init(),
      this.sendMessageStatus = const BlocStatus.initial(),
      this.salesChat = const PageState.init(),
      this.purchasesChat = const PageState.init(),
      this.messageStatus = const PageState.init(),
      this.deleteMessage = const BlocStatus.initial(),
      this.dataMessage,
      this.deleteChat = const BlocStatus.initial()});

  ChatState copyWith(
      {final PageState<ChatsModel>? chatStatus,
      final PageState<List<Data>>? salesChat,
      final PageState<List<Data>>? purchasesChat,
      final BlocStatus? sendMessageStatus,
      final PageState<MessagesModel>? messageStatus,
      final BlocStatus? deleteMessage,
      final DataMessage? dataMessage,
      final BlocStatus? deleteChat}) {
    return ChatState(
        chatStatus: chatStatus ?? this.chatStatus,
        salesChat: salesChat ?? this.salesChat,
        purchasesChat: purchasesChat ?? this.purchasesChat,
        sendMessageStatus: sendMessageStatus ?? this.sendMessageStatus,
        messageStatus: messageStatus ?? this.messageStatus,
        deleteMessage: deleteMessage ?? this.deleteMessage,
        dataMessage: dataMessage,
        deleteChat: deleteChat ?? this.deleteChat);
  }
}
