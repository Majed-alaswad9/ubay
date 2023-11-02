import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';

import 'package:user/core/common/model/page_state/page_state.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/posts/data/model/city_model/city_model.dart';

import '../../data/model/category_model/category_model.dart';
import '../../data/model/posts_model.dart';
import '../../domain/usecases/add_like_use_case.dart';
import '../../domain/usecases/delete_like_use_case.dart';
import '../../domain/usecases/get_all_posts_use_case.dart';
import '../../domain/usecases/get_category_use_case.dart';
import '../../domain/usecases/get_store_use_case.dart';
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
  final ImagePicker picker;
  HomeBloc(this.getAllPostsUseCase, this.addLikeUseCase, this.deleteLikeUseCase,
      this.getCityUseCase, this.getCategoryUseCase, this.picker)
      : super(const HomeState()) {
    on<GetAllPostsEvent>(_onGetAllPosts);
    on<AddLikeEvent>(_onAddLike);
    on<DeleteLikeEvent>(_onDeleteLike);
    on<GetStoreEvent>(_onCityEvent);
    on<GetCategoryEvent>(_onGetCategoryEvent);
  }

  FutureOr<void> _onGetAllPosts(
      GetAllPostsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(allPosts: const PageState.loading()));
    final result = await getAllPostsUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(allPosts: PageState.error(exception: exception)));
    }, (value) {
      if (value.data.data.isNotEmpty) {
        emit(state.copyWith(allPosts: PageState.loaded(data: value.data)));
      } else {
        emit(state.copyWith(allPosts: const PageState.empty()));
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

  FutureOr<void> _onCityEvent(
      GetStoreEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(storeStatus: const PageState.loading()));
    final result = await getCityUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(storeStatus: PageState.error(exception: exception)));
    }, (value) {
      if (value.data.data.isNotEmpty) {
        emit(state.copyWith(storeStatus: PageState.loaded(data: value.data)));
      } else {
        emit(state.copyWith(storeStatus: const PageState.empty()));
      }
    });
  }

  FutureOr<void> _onGetCategoryEvent(
      GetCategoryEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(categoryStatus: const PageState.loading()));
    final result = await getCategoryUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(
          categoryStatus: PageState.error(exception: exception)));
    }, (value) {
      emit(state.copyWith(categoryStatus: PageState.loaded(data: value.data)));
    });
  }

  FutureOr<void> _onPickImage(
      PickImagesEvent event, Emitter<HomeState> emit) async {
    final pickedFiles = await picker.pickMultiImage();
    List<XFile> images = pickedFiles;
    List<File> photos = [];
    for (var i = 0; i < images.length; i++) {
      photos.add(File(images[i].path));
    }
    emit(state.copyWith(photos: photos));
  }
}
