import 'package:injectable/injectable.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/data/model/comments_model/comments_model.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';

@injectable
class GetCommentsUseCase
    extends UseCase<Result<ResponseWrapper<CommentsModel>>, CommentsParams> {
  final HomeRepository homeRepository;

  GetCommentsUseCase(this.homeRepository);
  @override
  Future<Result<ResponseWrapper<CommentsModel>>> call(
      CommentsParams params) async {
    return homeRepository.getComments(params);
  }
}

class CommentsParams {
  final String id;
  final String? page;
  final String? limit;
  final String? sort;
  final String? fields;
  final String? search;

  CommentsParams(
      this.id, this.page, this.limit, this.sort, this.fields, this.search);
  Map<String, dynamic> get idMap {
    return {
      'id': id,
    };
  }

  Map<String, dynamic> get queryMap {
    return {
      'page': page,
      'limit': limit,
      'sort': sort,
      'search': search,
      'fields': fields
    };
  }
}
