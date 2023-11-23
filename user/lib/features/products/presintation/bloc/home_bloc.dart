import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';

import 'package:user/core/common/model/page_state/page_state.dart';
import 'package:user/core/config/router/router.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/data/model/city_model/city_model.dart';

import '../../data/model/category_model/category_model.dart';
import '../../data/model/comments_model/comments_model.dart';
import '../../data/model/posts_model.dart';
import '../../domain/usecases/comment_use_case/add_comment_use_case.dart';
import '../../domain/usecases/add_like_use_case.dart';
import '../../domain/usecases/comment_use_case/delete_comment_use_case.dart';
import '../../domain/usecases/comment_use_case/edit_comment_use_case.dart';
import '../../domain/usecases/product_use_case/add_post_use_case.dart';
import '../../domain/usecases/delete_like_use_case.dart';
import '../../domain/usecases/product_use_case/delete_product_use_case.dart';
import '../../domain/usecases/product_use_case/edit_product_use_case.dart';
import '../../domain/usecases/product_use_case/get_all_posts_use_case.dart';
import '../../domain/usecases/product_use_case/get_category_use_case.dart';
import '../../domain/usecases/comment_use_case/get_comments_use_case.dart';
import '../../domain/usecases/product_use_case/get_store_use_case.dart';
import 'package:image_picker/image_picker.dart';

part 'home_event.dart';
part 'home_state.dart';

@LazySingleton()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  final AddLikeUseCase addLikeUseCase;
  final DeleteLikeUseCase deleteLikeUseCase;
  final GetStoreUseCase getCityUseCase;
  final GetCategoryUseCase getCategoryUseCase;
  final AddPostUseCase addPostUseCase;
  final GetCommentsUseCase getCommentsUseCase;
  final AddCommentUseCase addCommentUseCase;
  final EditProductUseCase editProductUseCase;
  final DeleteCommentUseCase deleteCommentUseCase;
  final EditCommentUseCase editCommentUseCase;
  final DeleteProductUseCase deleteProductUseCase;
  HomeBloc(
    this.getAllPostsUseCase,
    this.addLikeUseCase,
    this.deleteLikeUseCase,
    this.getCityUseCase,
    this.getCategoryUseCase,
    this.addPostUseCase,
    this.getCommentsUseCase,
    this.addCommentUseCase,
    this.editProductUseCase,
    this.deleteCommentUseCase,
    this.editCommentUseCase,
    this.deleteProductUseCase,
  ) : super(const HomeState()) {
    on<GetAllPostsEvent>(_onGetAllPosts);
    on<AddPostEvent>(_onAddPostEvent);
    on<AddLikeEvent>(_onAddLike);
    on<DeleteLikeEvent>(_onDeleteLike);
    on<GetStoreEvent>(_onStoreEvent);
    on<GetCategoryEvent>(_onGetCategoryEvent);
    on<PickImagesEvent>(_onPickImage);
    on<GetCommentsEvent>(_onGetCommentsEvent);
    on<AddCommentEvent>(_onAddCommentEvent);
    on<EditProductEvent>(_onEditProductEvent);
    on<DeleteProductEvent>(_onDeleteProduct);
    on<DeleteCommentEvent>(_onDeleteCommentEvent);
    on<EditCommentEvent>(_onEditCommentEvent);
  }

  FutureOr<void> _onGetAllPosts(
      GetAllPostsEvent event, Emitter<HomeState> emit) async {
    if (!state.deletePostOrComment.isSuccess()) {
      emit(state.copyWith(allPosts: const PageState.loading()));
    }
    final result = await getAllPostsUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(
          allPosts: PageState.error(exception: exception),
          deletePostOrComment: const BlocStatus.initial()));
    }, (value) {
      if (value.data.data!.isNotEmpty) {
        emit(state.copyWith(
            allPosts: PageState.loaded(data: value.data),
            deletePostOrComment: const BlocStatus.initial()));
      } else {
        emit(state.copyWith(
            allPosts: const PageState.empty(),
            deletePostOrComment: const BlocStatus.initial()));
      }
    });
  }

  FutureOr<void> _onAddLike(AddLikeEvent event, Emitter<HomeState> emit) async {
    final result = await addLikeUseCase(event.postId);
    result.fold((exception, message) {
      emit(state.copyWith(addLikeStatus: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(addLikeStatus: const BlocStatus.success()));
    });
  }

  FutureOr<void> _onDeleteLike(
      DeleteLikeEvent event, Emitter<HomeState> emit) async {
    final result = await deleteLikeUseCase(event.postId);
    result.fold((exception, message) {
      emit(state.copyWith(deleteLikeStatus: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(deleteLikeStatus: const BlocStatus.success()));
    });
  }

  FutureOr<void> _onStoreEvent(
      GetStoreEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(storeStatus: const PageState.loading()));
    final result = await getCityUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(storeStatus: PageState.error(exception: exception)));
    }, (value) {
      if (value.data.data.isNotEmpty) {
        emit(state.copyWith(
            storeStatus: PageState.loaded(data: value.data), photos: []));
      } else {
        emit(state.copyWith(storeStatus: const PageState.empty()));
      }
    });
  }

  FutureOr<void> _onGetCategoryEvent(
      GetCategoryEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(categoryStatus: const PageState.loading(), photos: []));
    final result = await getCategoryUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(
          categoryStatus: PageState.error(exception: exception)));
    }, (value) {
      emit(state.copyWith(categoryStatus: PageState.loaded(data: value.data)));
    });
  }

  List<File> photos = [];
  FutureOr<void> _onPickImage(
      PickImagesEvent event, Emitter<HomeState> emit) async {
    photos = [];
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickMultiImage();
    List<XFile> xPhotos = pickedImage;

    for (var i = 0; i < xPhotos.length; i++) {
      photos.add(File(xPhotos[i].path));
    }
    emit(state.copyWith(photos: photos));
  }

  FutureOr<void> _onAddPostEvent(
      AddPostEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(addPost: const BlocStatus.loading()));
    final result = await addPostUseCase(AddPostParams(event.title,
        event.content, event.price, event.store, event.category, photos));
    result.fold((exception, message) {
      emit(state.copyWith(addPost: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(addPost: const BlocStatus.success()));
    });
  }

  FutureOr<void> _onGetCommentsEvent(
      GetCommentsEvent event, Emitter<HomeState> emit) async {
    if (!state.deletePostOrComment.isSuccess() &&
        !state.addComment.isSuccess()) {
      emit(state.copyWith(commentsStatus: const PageState.loading()));
    }
    final result = await getCommentsUseCase(CommentsParams(event.id, event.page,
        event.limit, event.sort, event.fields, event.search));
    result.fold((exception, message) {
      emit(state.copyWith(
          commentsStatus: PageState.error(exception: exception)));
    }, (value) {
      if (value.data.data!.isNotEmpty) {
        emit(state.copyWith(
            commentsStatus: PageState.loaded(data: value.data),
            deletePostOrComment: const BlocStatus.initial(),
            addComment: const BlocStatus.initial()));
      } else {
        emit(state.copyWith(
            commentsStatus: const PageState.empty(),
            deletePostOrComment: const BlocStatus.initial(),
            addComment: const BlocStatus.initial()));
      }
    });
  }

  FutureOr<void> _onAddCommentEvent(
      AddCommentEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(addComment: const BlocStatus.loading()));
    final result = await addCommentUseCase(
        AddCommentParams(event.content, event.userId, event.postId));
    result.fold((exception, message) {
      emit(state.copyWith(addComment: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(addComment: const BlocStatus.success()));
      add(GetCommentsEvent(event.postId));
    });
  }

  FutureOr<void> _onDeleteCommentEvent(
      DeleteCommentEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(deletePostOrComment: const BlocStatus.loading()));
    final result = await deleteCommentUseCase(event.id);
    result.fold((exception, message) {
      emit(
          state.copyWith(deletePostOrComment: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(deletePostOrComment: const BlocStatus.success()));
      if (value) {
        add(GetCommentsEvent(event.postId));
      }
    });
  }

  FutureOr<void> _onDeleteProduct(
      DeleteProductEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(deletePostOrComment: const BlocStatus.loading()));
    final result = await deleteProductUseCase(event.id);
    result.fold((exception, message) {
      emit(
          state.copyWith(deletePostOrComment: BlocStatus.fail(error: message)));
      emit(state.copyWith(deletePostOrComment: const BlocStatus.initial()));
    }, (value) {
      emit(state.copyWith(deletePostOrComment: const BlocStatus.success()));
      add(GetAllPostsEvent());
    });
  }

  FutureOr<void> _onEditProductEvent(
      EditProductEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(editPost: const BlocStatus.loading()));
    final result = await editProductUseCase(EditProductParams(
        title: event.title,
        content: event.content,
        price: event.price,
        idStore: event.store,
        idCategory: event.category,
        id: event.id,
        photos: photos));

    result.fold((exception, message) {
      emit(state.copyWith(editPost: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(editPost: const BlocStatus.success()));
      event.context.goNamed(GRouter.config.homeScreen.homeScreen);
    });
  }

  FutureOr<void> _onEditCommentEvent(
      EditCommentEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(addComment: const BlocStatus.loading()));
    final result = await editCommentUseCase(
        EditCommentParams(event.content, event.userId, event.postId, event.id));
    result.fold((exception, message) {
      emit(state.copyWith(addComment: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(addComment: const BlocStatus.success()));
      add(GetCommentsEvent(event.postId));
    });
  }
}