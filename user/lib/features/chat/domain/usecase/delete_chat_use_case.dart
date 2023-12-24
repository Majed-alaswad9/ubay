import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/chat/domain/repository/chat_repository.dart';

@injectable
class DeleteChatUseCase extends UseCase<Result<bool>, String> {
  final ChatRepository chatRepository;

  DeleteChatUseCase(this.chatRepository);
  @override
  Future<Result<bool>> call(String params) async {
    return chatRepository.deleteChat(params);
  }
}
