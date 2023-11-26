part of 'chat_bloc.dart';

@immutable
class ChatState {
  final PageState<ChatsModel> chatStatus;
  final PageState<List<Data>> salesChat;
  final PageState<List<Data>> purchasesChat;

  const ChatState(
      {this.chatStatus = const PageState.init(),
      this.salesChat = const PageState.init(),
      this.purchasesChat = const PageState.init()});

  ChatState copyWith(
      {final PageState<ChatsModel>? chatStatus,
      final PageState<List<Data>>? salesChat,
      final PageState<List<Data>>? purchasesChat}) {
    return ChatState(
        chatStatus: chatStatus ?? this.chatStatus,
        salesChat: salesChat ?? this.salesChat,
        purchasesChat: purchasesChat ?? this.purchasesChat);
  }
}
