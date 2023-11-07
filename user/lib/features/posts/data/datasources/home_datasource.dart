import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/client.dart';
import 'package:user/core/api/client_config.dart';
import 'package:user/core/common/constants/configuration/uri_routs.dart';
import 'package:user/features/posts/data/model/category_model/category_model.dart';
import 'package:user/features/posts/data/model/city_model/city_model.dart';
import 'package:user/features/posts/data/model/comments_model/comments_model.dart';
import 'package:user/features/posts/data/model/posts_model.dart';
import 'package:user/features/posts/domain/usecases/comment_use_case/add_comment_use_case.dart';
import 'package:user/features/posts/domain/usecases/product_use_case/add_post_use_case.dart';
import 'package:user/features/posts/domain/usecases/comment_use_case/get_comments_use_case.dart';
import 'package:user/features/posts/domain/usecases/product_use_case/edit_product_use_case.dart';

import '../../../../core/common/model/response_wrapper/response_wrapper.dart';

@injectable
class HomeDataSource {
  final ClientApi clientApi;

  HomeDataSource(this.clientApi);

  Future<ResponseWrapper<PostsModel>> getAllPosts() {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.product.product,
          clientMethod: ClientMethod.get,
          queryParameters: {'page': '1', 'limit': '5', 'is_paid': 'false'}));

      return ResponseWrapper.fromJson(response.data, (json) {
        final posts = PostsModel.fromJson(response.data);
        return posts;
      });
    });
  }

  Future<ResponseWrapper<bool>> addPost(
      AddPostParams params, List<File> photos) {
    return throwAppException(() async {
      Map data = params.map;
      List<MultipartFile> files = [];
      for (File file in photos) {
        files.add(await MultipartFile.fromFile(file.path));
      }

      data['photos'] = files;
      print(data);
      FormData formData = FormData.fromMap(data as Map<String, dynamic>);
      print(formData.files.length);
      final response = await clientApi.request(RequestConfig(
          data: formData,
          endpoint: EndPoints.product.product,
          clientMethod: ClientMethod.post));
      return ResponseWrapper.fromJson(response.data, (json) {
        return true;
      });
    });
  }

  Future<void> addLike(String postId) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint:
              '${EndPoints.product.product}/$postId${EndPoints.product.likes}',
          clientMethod: ClientMethod.post));
    });
  }

  Future<void> deleteLike(String postId) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint:
              '${EndPoints.product.product}/$postId${EndPoints.product.likes}',
          clientMethod: ClientMethod.delete));
    });
  }

  Future<ResponseWrapper<StoreModel>> getStore() {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.stores.stores, clientMethod: ClientMethod.get));
      return ResponseWrapper.fromJson(response.data, (json) {
        final store = StoreModel.fromJson(response.data);
        return store;
      });
    });
  }

  Future<ResponseWrapper<CategoryModel>> getCategory() {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.product.category,
          clientMethod: ClientMethod.get));
      return ResponseWrapper.fromJson(response.data, (json) {
        final categories = CategoryModel.fromJson(response.data);
        return categories;
      });
    });
  }

  Future<ResponseWrapper<CommentsModel>> getComments(CommentsParams params) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint:
              '${EndPoints.product.product}/${params.id}${EndPoints.product.comments}',
          clientMethod: ClientMethod.get,
          data: params.idMap,
          queryParameters: params.queryMap));
      return ResponseWrapper.fromJson(response.data, (json) {
        final result = CommentsModel.fromJson(response.data);
        return result;
      });
    });
  }

  Future<ResponseWrapper<DataComment>> addComment(AddCommentParams params) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          data: params.map,
          endpoint: EndPoints.product.comments,
          clientMethod: ClientMethod.post));

      return ResponseWrapper.fromJson(response.data, (json) {
        final result = DataComment.fromJson(response.data);
        return result;
      });
    });
  }

  Future<ResponseWrapper<bool>> editProduct(EditProductParams params) {
    return throwAppException(() async {
      Map data = params.map;
      List<MultipartFile> files = [];
      for (File file in params.photos) {
        files.add(await MultipartFile.fromFile(file.path));
      }
      data['photos'] = files;
      FormData formData = FormData.fromMap(data as Map<String, dynamic>);
      final response = await clientApi.request(RequestConfig(
          endpoint: '${EndPoints.product.product}/${params.id}',
          data: formData,
          clientMethod: ClientMethod.patch));

      return ResponseWrapper.fromJson(response.data, (json) {
        return true;
      });
    });
  }

  Future<ResponseWrapper<bool>> deleteProduct(String id) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: '${EndPoints.product.product}/$id}',
          clientMethod: ClientMethod.delete));
      return ResponseWrapper.fromJson(response.data, (json) {
        return true;
      });
    });
  }
}
