part of 'home_bloc.dart';

@immutable
class HomeState {
  final PageState<ProductsModel> allProducts;
  final PageState<Product> getProduct;
  final BlocStatus addProduct;
  final BlocStatus editProduct;
  final BlocStatus addLikeStatus;
  final BlocStatus deleteLikeStatus;
  final List<File>? photos;
  final PageState<StoreModel> storeStatus;
  final PageState<CategoryModel> categoryStatus;
  final BlocStatus deleteProductOrComment;
  final PageState<CommentsModel> commentsStatus;
  final BlocStatus addComment;
  final DataComment? commentsModel;
  HomeState copyWith({
    final PageState<ProductsModel>? allProducts,
    final PageState<Product>? getProduct,
    final BlocStatus? addLikeStatus,
    final BlocStatus? addProduct,
    final BlocStatus? editProduct,
    final BlocStatus? deleteProductOrComment,
    final PageState<StoreModel>? storeStatus,
    final List<File>? photos,
    final PageState<CategoryModel>? categoryStatus,
    final BlocStatus? deleteLikeStatus,
    final PageState<CommentsModel>? commentsStatus,
    final DataComment? commentsModel,
    final BlocStatus? addComment,
    final PageState<CouponModel>? couponsStatus,
    final BlocStatus? addCouponStatus,
    final BlocStatus? addPaymentStatus,
    final BlocStatus? deleteCouponStatus,
  }) {
    return HomeState(
        allProducts: allProducts ?? this.allProducts,
        getProduct: getProduct ?? this.getProduct,
        addProduct: addProduct ?? const BlocStatus.initial(),
        editProduct: editProduct ?? const BlocStatus.initial(),
        deleteProductOrComment:
            deleteProductOrComment ?? this.deleteProductOrComment,
        addLikeStatus: addLikeStatus ?? this.addLikeStatus,
        deleteLikeStatus: deleteLikeStatus ?? this.deleteLikeStatus,
        categoryStatus: categoryStatus ?? this.categoryStatus,
        photos: photos ?? this.photos,
        storeStatus: storeStatus ?? this.storeStatus,
        commentsStatus: commentsStatus ?? this.commentsStatus,
        commentsModel: commentsModel ?? this.commentsModel,
        addComment: addComment ?? this.addComment,
        couponsStatus: couponsStatus ?? this.couponsStatus,
        addCouponStatus: addCouponStatus ?? this.addCouponStatus,
        addPaymentStatus: addPaymentStatus ?? this.addPaymentStatus,
        deleteCouponStatus: deleteCouponStatus ?? this.deleteCouponStatus);
  }

  final PageState<CouponModel> couponsStatus;
  final BlocStatus addCouponStatus;
  final BlocStatus deleteCouponStatus;

  final BlocStatus addPaymentStatus;

  const HomeState(
      {this.addLikeStatus = const BlocStatus.initial(),
      this.getProduct = const PageState.init(),
      this.addComment = const BlocStatus.initial(),
      this.addProduct = const BlocStatus.initial(),
      this.editProduct = const BlocStatus.initial(),
      this.deleteProductOrComment = const BlocStatus.initial(),
      this.deleteLikeStatus = const BlocStatus.initial(),
      this.storeStatus = const PageState.init(),
      this.photos,
      this.categoryStatus = const PageState.init(),
      this.allProducts = const PageState.init(),
      this.commentsModel,
      this.commentsStatus = const PageState.init(),
      this.couponsStatus = const PageState.init(),
      this.addCouponStatus = const BlocStatus.initial(),
      this.addPaymentStatus = const BlocStatus.initial(),
      this.deleteCouponStatus = const BlocStatus.initial()});
}
