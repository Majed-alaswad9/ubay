import 'dart:io';

import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/posts/data/model/category_model/category_model.dart';
import 'package:user/features/posts/data/model/comments_model/comments_model.dart';
import 'package:user/features/posts/data/model/posts_model.dart';
import 'package:user/features/posts/domain/usecases/add_comment_use_case.dart';
import 'package:user/features/posts/domain/usecases/add_post_use_case.dart';
import 'package:user/features/posts/domain/usecases/get_comments_use_case.dart';

import '../../../../core/api/result.dart';
import '../../data/model/city_model/city_model.dart';

abstract class HomeRepository {
  Future<Result<ResponseWrapper<PostsModel>>> getAllPosts();
  Future<Result<ResponseWrapper<bool>>> addPost(
      AddPostParams params, List<File> photos);
  Future<Result<void>> addLike(String postId);
  Future<Result<void>> deleteLike(String postId);
  Future<Result<ResponseWrapper<StoreModel>>> getStore();
  Future<Result<ResponseWrapper<CategoryModel>>> getCategory();
  Future<Result<ResponseWrapper<CommentsModel>>> getComments(
      CommentsParams commentsParams);
  Future<Result<ResponseWrapper<bool>>> addComment(AddCommentParams params);
}
