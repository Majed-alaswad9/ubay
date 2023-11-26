import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/chat/data/model/chat_model/chats_model.dart';
import 'package:user/features/chat/domain/repository/chat_repository.dart';

@injectable
class GetChatsUseCase
    extends UseCase<Result<ResponseWrapper<ChatsModel>>, GetChatsParams> {
  final ChatRepository chatRepository;

  GetChatsUseCase(this.chatRepository);
  @override
  Future<Result<ResponseWrapper<ChatsModel>>> call(
      GetChatsParams params) async {
    return chatRepository.getAllChats(params);
  }
}

class GetChatsParams {
  final int page;
  final int limit;

  GetChatsParams(this.page, this.limit);

  Map<String, dynamic> get map => {'page': '$page', 'limit': '$limit'};
}
