import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/posts/data/datasources/home_datasource.dart';
import 'package:user/features/posts/data/model/category_model/category_model.dart';
import 'package:user/features/posts/data/model/city_model/city_model.dart';
import 'package:user/features/posts/data/model/comments_model/comments_model.dart';
import 'package:user/features/posts/data/model/posts_model.dart';
import 'package:user/features/posts/domain/repository/home_repository.dart';
import 'package:user/features/posts/domain/usecases/comment_use_case/add_comment_use_case.dart';
import 'package:user/features/posts/domain/usecases/product_use_case/add_post_use_case.dart';
import 'package:user/features/posts/domain/usecases/comment_use_case/get_comments_use_case.dart';
import 'package:user/features/posts/domain/usecases/product_use_case/edit_product_use_case.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImplement extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImplement(this.homeDataSource);
  @override
  Future<Result<ResponseWrapper<bool>>> addPost(
      AddPostParams params, List<File> photos) {
    return toApiResult(() {
      final result = homeDataSource.addPost(params, photos);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<PostsModel>>> getAllPosts() {
    return toApiResult(() {
      final result = homeDataSource.getAllPosts();
      return result;
    });
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> addLike(String postId) {
    return toApiResult(() {
      final result = homeDataSource.addLike(postId);
    });
  }

  @override
  Future<Result<void>> deleteLike(String postId) {
    return toApiResult(() {
      final result = homeDataSource.deleteLike(postId);
    });
  }

  @override
  Future<Result<ResponseWrapper<StoreModel>>> getStore() {
    return toApiResult(() {
      final result = homeDataSource.getStore();
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<CategoryModel>>> getCategory() {
    return toApiResult(() {
      final result = homeDataSource.getCategory();
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<CommentsModel>>> getComments(
      CommentsParams commentsParams) {
    return toApiResult(() {
      final result = homeDataSource.getComments(commentsParams);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<DataComment>>> addComment(
      AddCommentParams params) {
    return toApiResult(() {
      final result = homeDataSource.addComment(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<bool>>> deleteComment(String idComment) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<Result<ResponseWrapper<bool>>> deleteProduct(String id) {
    return toApiResult(() {
      final result = homeDataSource.deleteProduct(id);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<DataComment>>> editComment(
      AddCommentParams params) {
    // TODO: implement editComment
    throw UnimplementedError();
  }

  @override
  Future<Result<ResponseWrapper<bool>>> editProduct(EditProductParams params) {
    return toApiResult(() {
      final result = homeDataSource.editProduct(params);
      return result;
    });
  }
}
