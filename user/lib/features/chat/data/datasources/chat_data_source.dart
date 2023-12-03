import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/client.dart';
import 'package:user/core/api/client_config.dart';
import 'package:user/core/common/constants/configuration/uri_routs.dart';
import 'package:user/features/chat/data/model/chat_model/chats_model.dart';
import 'package:user/features/chat/data/model/messages_model/messages_model.dart';
import 'package:user/features/chat/domain/usecase/get_chats_use_case.dart';
import 'package:user/features/chat/domain/usecase/get_messages_use_case.dart';

import '../../../../core/common/model/response_wrapper/response_wrapper.dart';

@injectable
class ChatDataSource {
  final ClientApi clientApi;

  ChatDataSource(this.clientApi);
  Future<ResponseWrapper<ChatsModel>> getAllChat(GetChatsParams params) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.chats.chat,
          clientMethod: ClientMethod.get,
          queryParameters: params.map));
      return ResponseWrapper.fromJson(response.data, (json) {
        final result = ChatsModel.fromJson(response.data);
        return result;
      });
    });
  }

  Future<ResponseWrapper<MessagesModel>> getAllMessages(
      GetMessagesParams params) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint:
              '${EndPoints.chats.chat}/${params.chatId}${EndPoints.chats.messages}',
          clientMethod: ClientMethod.get,
          queryParameters: params.map));

      return ResponseWrapper.fromJson(response.data, (json) {
        final result = MessagesModel.fromJson(response.data);
        return result;
      });
    });
  }
}
