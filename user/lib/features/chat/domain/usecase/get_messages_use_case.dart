import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/chat/data/model/messages_model/messages_model.dart';
import 'package:user/features/chat/domain/repository/chat_repository.dart';

@injectable
class GetMessagesUseCase
    extends UseCase<Result<ResponseWrapper<MessagesModel>>, GetMessagesParams> {
  final ChatRepository chatRepository;

  GetMessagesUseCase(this.chatRepository);
  @override
  Future<Result<ResponseWrapper<MessagesModel>>> call(
      GetMessagesParams params) async {
    return chatRepository.getAllMessages(params);
  }
}

class GetMessagesParams {
  final int page;
  final int limit;
  final String chatId;

  GetMessagesParams(this.page, this.limit, this.chatId);

  Map<String, dynamic> get map => {'page': '$page', 'limit': '$limit'};
}
