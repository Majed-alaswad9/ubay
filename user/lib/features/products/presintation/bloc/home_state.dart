part of 'home_bloc.dart';

@immutable
class HomeState {
  final PageState<PostsModel>? allPosts;
  final BlocStatus addLikeStatus;
  final BlocStatus deleteLikeStatus;
  final List<File>? photos;
  final PageState<StoreModel> storeStatus;
  final PageState<CategoryModel> categoryStatus;
  final BlocStatus addPost;
  final BlocStatus editPost;
  final BlocStatus deletePostOrComment;
  final PageState<CommentsModel> commentsStatus;
  final BlocStatus addComment;
  final DataComment? commentsModel;
  final PageState<CouponModel> couponsState;
  final BlocStatus addPaymentStatus;
  final BlocStatus deleteCoupon;

  const HomeState(
      {this.addLikeStatus = const BlocStatus.initial(),
      this.addComment = const BlocStatus.initial(),
      this.addPost = const BlocStatus.initial(),
      this.editPost = const BlocStatus.initial(),
      this.deletePostOrComment = const BlocStatus.initial(),
      this.deleteLikeStatus = const BlocStatus.initial(),
      this.storeStatus = const PageState.init(),
      this.photos,
      this.categoryStatus = const PageState.init(),
      this.allPosts = const PageState.init(),
      this.commentsModel,
      this.commentsStatus = const PageState.init(),
      this.couponsState = const PageState.init(),
      this.addPaymentStatus = const BlocStatus.initial(),
      this.deleteCoupon = const BlocStatus.initial()});

  HomeState copyWith(
      {final PageState<PostsModel>? allPosts,
      final BlocStatus? addLikeStatus,
      final BlocStatus? addPost,
      final BlocStatus? editPost,
      final BlocStatus? deletePostOrComment,
      final PageState<StoreModel>? storeStatus,
      final List<File>? photos,
      final PageState<CategoryModel>? categoryStatus,
      final BlocStatus? deleteLikeStatus,
      final PageState<CommentsModel>? commentsStatus,
      final DataComment? commentsModel,
      final BlocStatus? addComment,
      final PageState<CouponModel>? couponsState,
      final BlocStatus? addPaymentStatus,
      final BlocStatus? deleteCoupon}) {
    return HomeState(
        allPosts: allPosts ?? this.allPosts,
        addPost: addPost ?? const BlocStatus.initial(),
        editPost: editPost ?? const BlocStatus.initial(),
        deletePostOrComment: deletePostOrComment ?? this.deletePostOrComment,
        addLikeStatus: addLikeStatus ?? this.addLikeStatus,
        deleteLikeStatus: deleteLikeStatus ?? this.deleteLikeStatus,
        categoryStatus: categoryStatus ?? this.categoryStatus,
        photos: photos ?? this.photos,
        storeStatus: storeStatus ?? this.storeStatus,
        commentsStatus: commentsStatus ?? this.commentsStatus,
        commentsModel: commentsModel ?? this.commentsModel,
        addComment: addComment ?? this.addComment,
        couponsState: couponsState ?? this.couponsState,
        addPaymentStatus: addPaymentStatus ?? this.addPaymentStatus,
        deleteCoupon: deleteCoupon ?? this.deleteCoupon);
  }
}
