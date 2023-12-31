import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:user/core/api/api_utils.dart';
import 'package:user/core/api/result.dart';
import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/products/data/datasources/home_datasource.dart';
import 'package:user/features/products/data/model/category_model/category_model.dart';
import 'package:user/features/products/data/model/city_model/city_model.dart';
import 'package:user/features/products/data/model/comments_model/comments_model.dart';
import 'package:user/features/products/data/model/coupon_model/coupon_model.dart';
import 'package:user/features/products/data/model/products_model.dart';
import 'package:user/features/products/domain/repository/home_repository.dart';
import 'package:user/features/products/domain/usecases/comment_use_case/add_comment_use_case.dart';
import 'package:user/features/products/domain/usecases/comment_use_case/edit_comment_use_case.dart';
import 'package:user/features/products/domain/usecases/coupons_use_case/add_coupon_use_case.dart';
import 'package:user/features/products/domain/usecases/coupons_use_case/get_coupons_use_case.dart';
import 'package:user/features/products/domain/usecases/create_chat_use_case.dart';
import 'package:user/features/products/domain/usecases/payment_use_case.dart';
import 'package:user/features/products/domain/usecases/product_use_case/add_product_use_case.dart';
import 'package:user/features/products/domain/usecases/comment_use_case/get_comments_use_case.dart';
import 'package:user/features/products/domain/usecases/product_use_case/edit_product_use_case.dart';
import 'package:user/features/products/domain/usecases/product_use_case/get_all_products_use_case.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImplement extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImplement(this.homeDataSource);
  @override
  Future<Result<ResponseWrapper<bool>>> addProduct(
      AddProductParams params, List<File> photos) {
    return toApiResult(() {
      final result = homeDataSource.addProduct(params, photos);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<ProductsModel>>> getAllProducts(
      GetAllProductsParams params) {
    return toApiResult(() {
      final result = homeDataSource.getAllProducts(params);
      return result;
    });
  }

  //todo convert void to bool
  @override
  Future<Result<void>> addLike(String postId) {
    return toApiResult(() {
      final result = homeDataSource.addLike(postId);
    });
  }

  //todo convert void to bool
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
  Future<Result<bool>> deleteComment(String idComment) {
    return toApiResult(() {
      final result = homeDataSource.deleteComment(idComment);
      return result;
    });
  }

  @override
  Future<Result<void>> deleteProduct(String id) {
    return toApiResult(() {
      homeDataSource.deleteProduct(id);
    });
  }

  @override
  Future<Result<ResponseWrapper<DataComment>>> editComment(
      EditCommentParams params) {
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

  @override
  Future<Result<ResponseWrapper<CouponModel>>> getCoupons(
      GetCouponsParams params) {
    return toApiResult(() {
      final result = homeDataSource.getCoupons(params);
      return result;
    });
  }

  @override
  Future<Result<bool>> addPayment(PaymentParams params) {
    return toApiResult(() {
      final result = homeDataSource.addPayment(params);
      return result;
    });
  }

  @override
  Future<Result<bool>> addCoupon(AddCouponParams params) {
    return toApiResult(() {
      final result = homeDataSource.addCoupon(params);
      return result;
    });
  }

  @override
  Future<Result<bool>> deleteCoupon(String params) {
    return toApiResult(() {
      final result = homeDataSource.deleteCoupon(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<Product>>> getProduct(String id) {
    return toApiResult(() {
      final result = homeDataSource.getProduct(id);
      return result;
    });
  }

  @override
  Future<Result<bool>> createChat(CreateChatParams params) {
    return toApiResult(() {
      final result = homeDataSource.createChat(params);
      return result;
    });
  }
}
