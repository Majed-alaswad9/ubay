import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/chat/data/datasources/chat_data_source.dart';
import 'package:user/features/chat/data/model/chat_model/chats_model.dart';
import 'package:user/features/chat/data/model/messages_model/messages_model.dart';
import 'package:user/features/chat/domain/repository/chat_repository.dart';
import 'package:user/features/chat/domain/usecase/add_message_use_case.dart';
import 'package:user/features/chat/domain/usecase/delete_message_use_case.dart';
import 'package:user/features/chat/domain/usecase/get_chats_use_case.dart';
import 'package:user/features/chat/domain/usecase/get_messages_use_case.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImplement implements ChatRepository {
  final ChatDataSource chatDataSource;

  ChatRepositoryImplement(this.chatDataSource);
  @override
  Future<Result<ResponseWrapper<ChatsModel>>> getAllChats(
      GetChatsParams params) {
    return toApiResult(() {
      final result = chatDataSource.getAllChat(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<MessagesModel>>> getAllMessages(
      GetMessagesParams params) {
    return toApiResult(() {
      final result = chatDataSource.getAllMessages(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<DataMessage>>> addMessage(
      AddMessageParams params) {
    return toApiResult(() {
      final result = chatDataSource.addMessage(params);
      return result;
    });
  }

  @override
  Future<Result<bool>> deleteMessage(DeleteMessageParams params) {
    return toApiResult(() {
      final result = chatDataSource.deleteMessage(params);
      return result;
    });
  }

  @override
  Future<Result<bool>> deleteChat(String id) {
    return toApiResult(() {
      final result = chatDataSource.deleteChat(id);
      return result;
    });
  }
}
