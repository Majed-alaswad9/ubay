part of 'home_bloc.dart';

@immutable
class HomeState {
  final PageState<PostsModel> allPosts;
  final BlocStatus addLikeStatus;
  final BlocStatus deleteLikeStatus;
  final List<File>? photos;
  final PageState<StoreModel> storeStatus;
  final PageState<CategoryModel> categoryStatus;

  const HomeState(
      {this.addLikeStatus = const BlocStatus.initial(),
      this.deleteLikeStatus = const BlocStatus.initial(),
      this.storeStatus = const PageState.init(),
      this.photos,
      this.categoryStatus = const PageState.init(),
      this.allPosts = const PageState.init()});

  HomeState copyWith(
      {final PageState<PostsModel>? allPosts,
      final BlocStatus? addLikeStatus,
      final PageState<StoreModel>? storeStatus,
      final List<File>? photos,
      final PageState<CategoryModel>? categoryStatus,
      final BlocStatus? deleteLikeStatus}) {
    return HomeState(
        allPosts: allPosts ?? this.allPosts,
        addLikeStatus: addLikeStatus ?? this.addLikeStatus,
        deleteLikeStatus: deleteLikeStatus ?? this.deleteLikeStatus,
        categoryStatus: categoryStatus ?? this.categoryStatus,
        photos: photos ?? this.photos,
        storeStatus: storeStatus ?? this.storeStatus);
  }
}
