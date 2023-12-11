part of 'home_bloc.dart';

@immutable
class HomeEvent {}

class GetAllPostsEvent extends HomeEvent {}

class AddPostEvent extends HomeEvent {
  final String title;
  final String content;
  final int price;
  final String store;
  final String category;

  AddPostEvent(this.title, this.content, this.price, this.store, this.category);
}

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

class GetCommentsEvent extends HomeEvent {
  final String id;
  final String page;
  final String limit;
  final String sort;
  final String search;
  final String fields;

  GetCommentsEvent(this.id,
      {this.page = '1',
      this.limit = '10',
      this.sort = '',
      this.search = '',
      this.fields = ''});
}

class AddCommentEvent extends HomeEvent {
  final String content;
  final String userId;
  final String postId;

  AddCommentEvent(this.content, this.userId, this.postId);
}

class DeleteProductEvent extends HomeEvent {
  final String id;

  DeleteProductEvent(this.id);
}

class EditProductEvent extends HomeEvent {
  final String id;
  final String title;
  final String content;
  final int price;
  final String store;
  final String category;
  final BuildContext context;
  EditProductEvent(this.id, this.title, this.content, this.price, this.store,
      this.category, this.context);
}

class DeleteCommentEvent extends HomeEvent {
  final String postId;
  final String id;

  DeleteCommentEvent(this.id, this.postId);
}

class EditCommentEvent extends HomeEvent {
  final String content;
  final String userId;
  final String postId;
  final String id;

  EditCommentEvent(this.content, this.userId, this.postId, this.id);
}
