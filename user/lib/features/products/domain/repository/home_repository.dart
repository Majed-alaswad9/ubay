import 'dart:io';

import 'package:user/core/common/model/response_wrapper/response_wrapper.dart';
import 'package:user/features/products/data/model/category_model/category_model.dart';
import 'package:user/features/products/data/model/comments_model/comments_model.dart';
import 'package:user/features/products/data/model/coupon_model/coupon_model.dart';
import 'package:user/features/products/data/model/products_model.dart';
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

import '../../../../core/api/result.dart';
import '../../data/model/city_model/city_model.dart';

abstract class HomeRepository {
  Future<Result<ResponseWrapper<ProductsModel>>> getAllProducts(
      GetAllProductsParams params);
  Future<Result<ResponseWrapper<bool>>> addProduct(
      AddProductParams params, List<File> photos);
  Future<Result<void>> deleteProduct(String id);
  Future<Result<ResponseWrapper<Product>>> getProduct(String id);
  Future<Result<void>> addLike(String postId);
  Future<Result<void>> deleteLike(String postId);
  Future<Result<ResponseWrapper<StoreModel>>> getStore();
  Future<Result<ResponseWrapper<CategoryModel>>> getCategory();
  Future<Result<ResponseWrapper<CommentsModel>>> getComments(
      CommentsParams commentsParams);
  Future<Result<ResponseWrapper<DataComment>>> addComment(
      AddCommentParams params);
  Future<Result<ResponseWrapper<bool>>> editProduct(EditProductParams params);
  Future<Result<bool>> deleteComment(String idComment);
  Future<Result<ResponseWrapper<DataComment>>> editComment(
      EditCommentParams params);
  Future<Result<bool>> addPayment(PaymentParams params);
  Future<Result<ResponseWrapper<CouponModel>>> getCoupons(
      GetCouponsParams params);
  Future<Result<bool>> addCoupon(AddCouponParams params);
  Future<Result<bool>> deleteCoupon(String params);
  Future<Result<bool>> createChat(CreateChatParams params);
}
