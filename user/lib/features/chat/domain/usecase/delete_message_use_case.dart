import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/chat/domain/repository/chat_repository.dart';

@injectable
class DeleteMessageUseCase extends UseCase<Result<bool>, DeleteMessageParams> {
  final ChatRepository chatRepository;

  DeleteMessageUseCase(this.chatRepository);
  @override
  Future<Result<bool>> call(DeleteMessageParams params) async {
    return chatRepository.deleteMessage(params);
  }
}

class DeleteMessageParams {
  final String chatId;
  final String messageId;

  DeleteMessageParams(this.chatId, this.messageId);
}
