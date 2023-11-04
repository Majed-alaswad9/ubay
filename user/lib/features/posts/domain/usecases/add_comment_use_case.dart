import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/posts/domain/repository/home_repository.dart';

@injectable
class AddCommentUseCase
    extends UseCase<Result<ResponseWrapper<bool>>, AddCommentParams> {
  final HomeRepository homeRepository;

  AddCommentUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<bool>>> call(AddCommentParams params) async {
    return homeRepository.addComment(params);
  }
}

class AddCommentParams {
  final String content;
  final String userId;
  final String productId;

  AddCommentParams(this.content, this.userId, this.productId);

  Map<String, dynamic> get map =>
      {"content": content, "user": userId, "product": productId};
}
