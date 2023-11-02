import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/client.dart';
import 'package:user/core/api/client_config.dart';
import 'package:user/core/common/constants/configuration/uri_routs.dart';
import 'package:user/core/common/model/page_state/page_state.dart';
import 'package:user/features/posts/data/model/category_model/category_model.dart';
import 'package:user/features/posts/data/model/city_model/city_model.dart';
import 'package:user/features/posts/data/model/posts_model.dart';

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
}
