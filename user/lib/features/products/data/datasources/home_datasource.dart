import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/client.dart';
import 'package:user/core/api/client_config.dart';
import 'package:user/core/common/constants/configuration/uri_routs.dart';
import 'package:user/features/products/data/model/category_model/category_model.dart';
import 'package:user/features/products/data/model/city_model/city_model.dart';
import 'package:user/features/products/data/model/comments_model/comments_model.dart';
import 'package:user/features/products/data/model/coupon_model/coupon_model.dart';
import 'package:user/features/products/data/model/products_model.dart'
    as products;
import 'package:user/features/products/domain/usecases/comment_use_case/add_comment_use_case.dart';
import 'package:user/features/products/domain/usecases/coupons_use_case/add_coupon_use_case.dart';
import 'package:user/features/products/domain/usecases/coupons_use_case/get_coupons_use_case.dart';
import 'package:user/features/products/domain/usecases/create_chat_use_case.dart';
import 'package:user/features/products/domain/usecases/payment_use_case.dart';
import 'package:user/features/products/domain/usecases/product_use_case/add_product_use_case.dart';
import 'package:user/features/products/domain/usecases/comment_use_case/get_comments_use_case.dart';
import 'package:user/features/products/domain/usecases/product_use_case/edit_product_use_case.dart';
import 'package:http_parser/http_parser.dart' as mime;
import 'package:user/features/products/domain/usecases/product_use_case/get_all_products_use_case.dart';
import '../../../../core/common/model/response_wrapper/response_wrapper.dart';

@injectable
class HomeDataSource {
  final ClientApi clientApi;

  HomeDataSource(this.clientApi);

  Future<ResponseWrapper<products.ProductsModel>> getAllProducts(
      GetAllProductsParams params) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: EndPoints.product.product,
          clientMethod: ClientMethod.get,
          queryParameters: params.map));

      return ResponseWrapper.fromJson(response.data, (json) {
        final posts = products.ProductsModel.fromJson(response.data);
        return posts;
      });
    });
  }

  Future<ResponseWrapper<bool>> addProduct(
      AddProductParams params, List<File> photos) {
    return throwAppException(() async {
      Map data = params.map;
      List<MultipartFile> files = [];
      for (File file in photos) {
        files.add(await MultipartFile.fromFile(file.path,
            contentType: mime.MediaType('image', 'jpeg')));
      }

      data['photos'] = files;

      FormData formData = FormData.fromMap(data as Map<String, dynamic>);

      final response = await clientApi.request(RequestConfig(
          data: formData,
          endpoint: EndPoints.product.product,
          clientMethod: ClientMethod.post));
      return ResponseWrapper.fromJson(response.data, (json) {
        return true;
      });
    });
  }

  Future<ResponseWrapper<products.Product>> getProduct(String id) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint: '${EndPoints.product.product}/$id',
          clientMethod: ClientMethod.get));
      return ResponseWrapper.fromJson(response.data, (json) {
        final product = products.Product.fromJson(response.data);
        return product;
      });
    });
  }

  Future<void> addLike(String postId) {
    return throwAppException(() async {
      await clientApi.request(RequestConfig(
          endpoint:
              '${EndPoints.product.product}/$postId${EndPoints.product.likes}',
          clientMethod: ClientMethod.post));
    });
  }

  Future<void> deleteLike(String postId) {
    return throwAppException(() async {
      await clientApi.request(RequestConfig(
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

  Future<void> deleteProduct(String id) {
    return throwAppException(() async {
      await clientApi.request(RequestConfig(
          endpoint: '${EndPoints.product.product}/$id',
          clientMethod: ClientMethod.delete));
    });
  }

  Future<bool> deleteComment(String id) {
    return throwAppException(() async {
      await clientApi.request(RequestConfig(
          endpoint: '${EndPoints.product.comments}/$id',
          clientMethod: ClientMethod.delete));
      return true;
    });
  }

  Future<bool> addPayment(PaymentParams params) {
    return throwAppException(() async {
      await clientApi.request(RequestConfig(
          endpoint: EndPoints.product.payment,
          clientMethod: ClientMethod.post,
          data: params.map));
      return true;
    });
  }

  Future<ResponseWrapper<CouponModel>> getCoupons(GetCouponsParams params) {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
          endpoint:
              '${EndPoints.product.product}/${params.id}${EndPoints.product.coupons}',
          queryParameters: params.map,
          clientMethod: ClientMethod.get));
      return ResponseWrapper.fromJson(response.data, (json) {
        final result = CouponModel.fromJson(response.data);
        return result;
      });
    });
  }

  Future<bool> deleteCoupon(String id) {
    return throwAppException(() async {
      await clientApi.request(RequestConfig(
          endpoint: "${EndPoints.product.coupons}/$id",
          clientMethod: ClientMethod.delete));
      return true;
    });
  }

  Future<bool> addCoupon(AddCouponParams params) {
    return throwAppException(() async {
      await clientApi.request(RequestConfig(
          endpoint: EndPoints.product.coupons,
          clientMethod: ClientMethod.post,
          data: params.map));
      return true;
    });
  }

  Future<bool> createChat(CreateChatParams params) {
    return throwAppException(() async {
      await clientApi.request(RequestConfig(
          endpoint: EndPoints.chats.chat,
          clientMethod: ClientMethod.post,
          data: params.map));
      return true;
    });
  }
}
