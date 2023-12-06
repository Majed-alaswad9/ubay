import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/chat/data/model/messages_model/messages_model.dart';
import 'package:user/features/chat/domain/repository/chat_repository.dart';

@injectable
class AddMessageUseCase
    extends UseCase<Result<ResponseWrapper<DataMessage>>, AddMessageParams> {
  final ChatRepository chatRepository;

  AddMessageUseCase(this.chatRepository);
  @override
  Future<Result<ResponseWrapper<DataMessage>>> call(
      AddMessageParams params) async {
    return chatRepository.addMessage(params);
  }
}

class AddMessageParams {
  final String chatId;
  final String content;
  final String user;

  AddMessageParams(this.chatId, this.content, this.user);

  Map<String, dynamic> get map =>
      {'content': content, 'chat': chatId, 'user': user};
}
