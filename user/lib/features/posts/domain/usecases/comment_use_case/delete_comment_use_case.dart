import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/posts/domain/repository/home_repository.dart';

@injectable
class DeleteCommentUseCase
    extends UseCase<Result<ResponseWrapper<bool>>, String> {
  final HomeRepository homeRepository;

  DeleteCommentUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<bool>>> call(String params) async {
    return homeRepository.deleteComment(params);
  }
}
