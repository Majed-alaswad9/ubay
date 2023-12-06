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

  GetAllMessagesEvent({this.page = 1, this.limit = 20, required this.chatId});
}

class AddMessageEvent extends ChatEvent {
  final AddMessageParams params;

  AddMessageEvent(this.params);
}

class DeleteMessageEvent extends ChatEvent {
  final DeleteMessageParams params;

  DeleteMessageEvent(this.params);
}

class DeleteChatEvent extends ChatEvent {
  final String id;

  DeleteChatEvent(this.id);
}
