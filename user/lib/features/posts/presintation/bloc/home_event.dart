part of 'home_bloc.dart';

@immutable
class HomeEvent {}

class GetAllPostsEvent extends HomeEvent {}

class AddLikeEvent extends HomeEvent {
  final String postId;

  AddLikeEvent(this.postId);
}

class DeleteLikeEvent extends HomeEvent {
  final String postId;

  DeleteLikeEvent(this.postId);
}

class GetStoreEvent extends HomeEvent {}

class GetCategoryEvent extends HomeEvent {}

class PickImagesEvent extends HomeEvent {}
