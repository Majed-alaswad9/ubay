import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/posts/data/model/posts_model.dart';
import 'package:user/features/posts/domain/repository/home_repository.dart';

@injectable
class GetAllPostsUseCase
    extends UseCase<Result<ResponseWrapper<PostsModel>>, NoParams> {
  final HomeRepository homeRepository;

  GetAllPostsUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<PostsModel>>> call(NoParams params) async {
    return homeRepository.getAllPosts();
  }
}
