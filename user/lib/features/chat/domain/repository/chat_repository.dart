import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/chat/data/model/chat_model/chats_model.dart';
import 'package:user/features/chat/data/model/messages_model/messages_model.dart';
import 'package:user/features/chat/domain/usecase/get_chats_use_case.dart';
import 'package:user/features/chat/domain/usecase/get_messages_use_case.dart';

import '../../../../core/api/result.dart';

abstract class ChatRepository {
  Future<Result<ResponseWrapper<ChatsModel>>> getAllChats(
      GetChatsParams params);
  Future<Result<ResponseWrapper<MessagesModel>>> getAllMessages(
      GetMessagesParams params);
}
