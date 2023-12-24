import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class CreateChatUseCase extends UseCase<Result<bool>, CreateChatParams> {
  final HomeRepository homeRepository;

  CreateChatUseCase(this.homeRepository);
  @override
  Future<Result<bool>> call(CreateChatParams params) async {
    return homeRepository.createChat(params);
  }
}

class CreateChatParams {
  final String productId;
  final String userId;

  CreateChatParams(this.productId, this.userId);

  Map<String, String> get map =>
      {"name": "sender", "product": productId, "user": userId};
}
