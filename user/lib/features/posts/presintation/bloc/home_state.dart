part of 'home_bloc.dart';

@immutable
class HomeState {
  final PageState<PostsModel> allPosts;
  final BlocStatus addLikeStatus;
  final BlocStatus deleteLikeStatus;
  final List<File>? photos;
  final PageState<StoreModel> storeStatus;
  final PageState<CategoryModel> categoryStatus;
  final BlocStatus addPost;
  final PageState<CommentsModel> commentsStatus;
  final BlocStatus addComment;
  final DataComment? commentsModel;

  const HomeState(
      {this.addLikeStatus = const BlocStatus.initial(),
      this.addComment = const BlocStatus.initial(),
      this.addPost = const BlocStatus.initial(),
      this.deleteLikeStatus = const BlocStatus.initial(),
      this.storeStatus = const PageState.init(),
      this.photos,
      this.categoryStatus = const PageState.init(),
      this.allPosts = const PageState.init(),
      this.commentsModel,
      this.commentsStatus = const PageState.init()});

  HomeState copyWith(
      {final PageState<PostsModel>? allPosts,
      final BlocStatus? addLikeStatus,
      final BlocStatus? addPost,
      final PageState<StoreModel>? storeStatus,
      final List<File>? photos,
      final PageState<CategoryModel>? categoryStatus,
      final BlocStatus? deleteLikeStatus,
      final PageState<CommentsModel>? commentsStatus,
      final DataComment? commentsModel,
      final BlocStatus? addComment}) {
    return HomeState(
        allPosts: allPosts ?? this.allPosts,
        addPost: addPost ?? this.addPost,
        addLikeStatus: addLikeStatus ?? this.addLikeStatus,
        deleteLikeStatus: deleteLikeStatus ?? this.deleteLikeStatus,
        categoryStatus: categoryStatus ?? this.categoryStatus,
        photos: photos ?? this.photos,
        storeStatus: storeStatus ?? this.storeStatus,
        commentsStatus: commentsStatus ?? this.commentsStatus,
        commentsModel: commentsModel ?? this.commentsModel,
        addComment: addComment ?? this.addComment);
  }
}
