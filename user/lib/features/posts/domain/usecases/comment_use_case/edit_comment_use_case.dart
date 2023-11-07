import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/posts/data/model/comments_model/comments_model.dart';
import 'package:user/features/posts/domain/repository/home_repository.dart';
import 'package:user/features/posts/domain/usecases/comment_use_case/add_comment_use_case.dart';

@injectable
class EditCommentUseCase
    extends UseCase<Result<ResponseWrapper<DataComment>>, AddCommentParams> {
  final HomeRepository homeRepository;

  EditCommentUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<DataComment>>> call(
      AddCommentParams params) async {
    return homeRepository.editComment(params);
  }
}
