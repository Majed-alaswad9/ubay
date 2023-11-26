part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class GetAllChatsEvent extends ChatEvent {
  final int page;
  final int limit;

  GetAllChatsEvent({this.page = 1, this.limit = 10});
}

class GetAllMessagesEvent extends ChatEvent {
  final int page;
  final int limit;
  final String chatId;

  GetAllMessagesEvent(this.page, this.limit, this.chatId);
}
