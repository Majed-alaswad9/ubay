import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/data/model/comments_model/comments_model.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class EditCommentUseCase
    extends UseCase<Result<ResponseWrapper<DataComment>>, EditCommentParams> {
  final HomeRepository homeRepository;

  EditCommentUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<DataComment>>> call(
      EditCommentParams params) async {
    return homeRepository.editComment(params);
  }
}

class EditCommentParams {
  final String content;
  final String userId;
  final String productId;
  final String commentId;

  EditCommentParams(this.content, this.userId, this.productId, this.commentId);

  Map<String, dynamic> get map =>
      {"content": content, "user": userId, "product": productId};
}
