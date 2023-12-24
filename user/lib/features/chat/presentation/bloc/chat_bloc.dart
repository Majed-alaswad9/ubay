import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/common/model/page_state/page_state.dart';
import 'package:user/features/chat/domain/usecase/add_message_use_case.dart';
import 'package:user/features/chat/domain/usecase/delete_message_use_case.dart';
import '../../../../core/common/constants/constants.dart';
import '../../data/model/chat_model/chats_model.dart';
import '../../data/model/messages_model/messages_model.dart';
import '../../domain/usecase/delete_chat_use_case.dart';
import '../../domain/usecase/get_chats_use_case.dart';
import '../../domain/usecase/get_messages_use_case.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@lazySingleton
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatsUseCase getChatsUseCase;
  final GetMessagesUseCase getMessagesUseCase;
  final AddMessageUseCase addMessageUseCase;
  final DeleteMessageUseCase deleteMessageUseCase;
  final DeleteChatUseCase deleteChatUseCase;
  ChatBloc(this.getChatsUseCase, this.getMessagesUseCase,
      this.addMessageUseCase, this.deleteMessageUseCase, this.deleteChatUseCase)
      : super(ChatState()) {
    on<GetAllChatsEvent>(_onGetAllChatsEvent);
    on<GetAllMessagesEvent>(_onGetAllMessages);
    on<AddMessageEvent>(_onAddMessageEvent);
    on<DeleteMessageEvent>(_onDeleteMessageEvent);
    on<DeleteChatEvent>(_onDeleteChatEvent);
  }

  FutureOr<void> _onGetAllChatsEvent(
      GetAllChatsEvent event, Emitter<ChatState> emit) async {
    if (!state.deleteChat.isSuccess()) {
      emit(state.copyWith(
          chatStatus: const PageState.loading(),
          purchasesChat: const PageState.loading(),
          salesChat: const PageState.loading()));
    }
    final result =
        await getChatsUseCase(GetChatsParams(event.page, event.limit));
    result.fold((exception, message) {
      emit(state.copyWith(
          salesChat: PageState.error(exception: exception),
          purchasesChat: PageState.error(exception: exception)));
    }, (value) {
      List<Data> sales = [];
      List<Data> purchases = [];
      for (var element in value.data.data) {
        if (user.id == element.customer.id) {
          purchases.add(element);
        } else {
          sales.add(element);
        }
      }
      emit(state.copyWith(
          chatStatus: PageState.loaded(data: value.data),
          salesChat: PageState.loaded(data: sales),
          deleteChat: const BlocStatus.initial(),
          purchasesChat: PageState.loaded(data: purchases)));
    });
  }

  FutureOr<void> _onGetAllMessages(
      GetAllMessagesEvent event, Emitter<ChatState> emit) async {
    if (state.deleteMessage.isInitial()) {
      emit(state.copyWith(
          messageStatus: const PageState.loading(),
          sendMessageStatus: const BlocStatus.initial()));
    }
    final result = await getMessagesUseCase(
        GetMessagesParams(event.page, event.limit, event.chatId));
    result.fold((exception, message) {
      emit(state.copyWith(
          messageStatus: PageState.error(exception: exception),
          deleteMessage: const BlocStatus.initial()));
    }, (value) {
      emit(state.copyWith(
        messageStatus: PageState.loaded(data: value.data),
        deleteMessage: const BlocStatus.initial(),
      ));
    });
  }

  FutureOr<void> _onAddMessageEvent(
      AddMessageEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(sendMessageStatus: const BlocStatus.loading()));
    Result result = await addMessageUseCase(event.params);
    result.fold((exception, message) {
      emit(state.copyWith(sendMessageStatus: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(
        sendMessageStatus: const BlocStatus.success(),
        dataMessage: value.data,
      ));
    });
  }

  FutureOr<void> _onDeleteMessageEvent(
      DeleteMessageEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(deleteMessage: const BlocStatus.loading()));
    final result = await deleteMessageUseCase(event.params);
    result.fold((exception, message) {
      emit(state.copyWith(deleteMessage: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(deleteMessage: const BlocStatus.success()));
    });
  }

  FutureOr<void> _onDeleteChatEvent(
      DeleteChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(deleteChat: const BlocStatus.loading()));
    final result = await deleteChatUseCase(event.id);
    result.fold((exception, message) {
      emit(state.copyWith(deleteChat: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(deleteChat: const BlocStatus.success()));
      add(GetAllChatsEvent());
    });
  }
}
