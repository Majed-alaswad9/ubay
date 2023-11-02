import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/posts/data/datasources/home_datasource.dart';
import 'package:user/features/posts/data/model/category_model/category_model.dart';
import 'package:user/features/posts/data/model/city_model/city_model.dart';
import 'package:user/features/posts/data/model/posts_model.dart';
import 'package:user/features/posts/domain/repository/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImplement extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImplement(this.homeDataSource);
  @override
  Future<Result<ResponseWrapper<bool>>> addPost(String title, String content,
      int price, String idStore, String idCategory, List<File> images) {
    // TODO: implement addPost
    throw UnimplementedError();
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
}
