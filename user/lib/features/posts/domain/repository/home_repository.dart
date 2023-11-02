import 'dart:io';

import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/posts/data/model/category_model/category_model.dart';
import 'package:user/features/posts/data/model/posts_model.dart';

import '../../../../core/api/result.dart';
import '../../data/model/city_model/city_model.dart';

abstract class HomeRepository {
  Future<Result<ResponseWrapper<PostsModel>>> getAllPosts();
  Future<Result<ResponseWrapper<bool>>> addPost(String title, String content,
      int price, String idStore, String idCategory, List<File> images);
  Future<Result<void>> addLike(String postId);
  Future<Result<void>> deleteLike(String postId);
  Future<Result<ResponseWrapper<StoreModel>>> getStore();
  Future<Result<ResponseWrapper<CategoryModel>>> getCategory();
}
