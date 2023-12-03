import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/common/model/page_state/page_state.dart';
import 'package:user/features/app/domain/repository/prefs_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../data/model/chat_model/chats_model.dart';
import '../../data/model/messages_model/messages_model.dart';
import '../../domain/usecase/get_chats_use_case.dart';
import '../../domain/usecase/get_messages_use_case.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@lazySingleton
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatsUseCase getChatsUseCase;
  final GetMessagesUseCase getMessagesUseCase;
  ChatBloc(this.getChatsUseCase, this.getMessagesUseCase)
      : super(const ChatState()) {
    on<GetAllChatsEvent>(_onGetAllChatsEvent);
    on<GetAllMessagesEvent>(_onGetAllMessages);
  }

  FutureOr<void> _onGetAllChatsEvent(
      GetAllChatsEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(
        chatStatus: const PageState.loading(),
        purchasesChat: const PageState.loading(),
        salesChat: const PageState.loading()));
    final result =
        await getChatsUseCase(GetChatsParams(event.page, event.limit));
    result.fold((exception, message) {
      emit(state.copyWith(
          salesChat: PageState.error(exception: exception),
          purchasesChat: PageState.error(exception: exception)));
    }, (value) {
      final user = GetIt.I<PrefsRepository>().user;
      List<Data> sales = [];
      List<Data> purchases = [];
      for (var element in value.data.data) {
        if (user!.user.id == element.customer.id) {
          purchases.add(element);
        } else {
          sales.add(element);
        }
      }
      emit(state.copyWith(
          chatStatus: PageState.loaded(data: value.data),
          salesChat: PageState.loaded(data: sales),
          purchasesChat: PageState.loaded(data: purchases)));
    });
  }

  FutureOr<void> _onGetAllMessages(
      GetAllMessagesEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(messageStatus: const PageState.loading()));
    final result = await getMessagesUseCase(
        GetMessagesParams(event.page, event.limit, event.chatId));
    result.fold((exception, message) {
      emit(
          state.copyWith(messageStatus: PageState.error(exception: exception)));
    }, (value) {
      emit(state.copyWith(messageStatus: PageState.loaded(data: value.data)));
    });
  }
}
