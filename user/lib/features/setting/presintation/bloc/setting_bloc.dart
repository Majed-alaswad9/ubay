import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/core/common/model/page_state/page_state.dart';
import 'package:user/core/use_case/use_case.dart';
import 'package:user/features/products/data/model/category_model/category_model.dart';
import 'package:user/features/setting/domain/usecase/change_password_use_case.dart';
import 'package:user/features/setting/domain/usecase/edit_profile_use_case.dart';
import 'package:user/features/setting/domain/usecase/git_cities_use_case.dart';

import '../../../auth/data/model/login_model/login_model.dart';
import '../../domain/usecase/get_me_use_case.dart';

part 'setting_event.dart';
part 'setting_state.dart';

@lazySingleton
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final GetMeUseCase getMeUseCase;
  final EditProfileUseCase editProfileUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final GetCitiesUseCase getCitiesUseCase;
  SettingBloc(this.getMeUseCase, this.editProfileUseCase,
      this.changePasswordUseCase, this.getCitiesUseCase)
      : super(const SettingState()) {
    on<GetMeEvent>(_onGetMeEvent);
    on<PickPhotoEvent>(_onPickImage);
    on<EditMyProfileEvent>(_onEditProfileEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<GetCitiesEvent>(_onGetCitiesEvent);
  }

  FutureOr<void> _onGetMeEvent(
      GetMeEvent event, Emitter<SettingState> emit) async {
    emit(state.copyWith(profileMe: const PageState.loading()));
    final result = await getMeUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(profileMe: PageState.error(exception: exception)));
    }, (value) {
      emit(state.copyWith(profileMe: PageState.loaded(data: value.data)));
    });
  }

  File? photo;
  FutureOr<void> _onPickImage(
      PickPhotoEvent event, Emitter<SettingState> emit) async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: event.imageSource);
    if (pickedImage != null) {
      photo = File(pickedImage.path);
    }
    emit(state.copyWith(photo: File(pickedImage!.path)));
  }

  FutureOr<void> _onEditProfileEvent(
      EditMyProfileEvent event, Emitter<SettingState> emit) async {
    emit(state.copyWith(updateProfile: const BlocStatus.loading()));
    final result = await editProfileUseCase(
        EditProfileParams(name: event.name, email: event.email, photo: photo));
    result.fold((exception, message) {
      photo = null;
      emit(state.copyWith(updateProfile: BlocStatus.fail(error: message)));
    }, (value) {
      photo = null;
      emit(state.copyWith(
          updateProfile: const BlocStatus.success(),
          profileMe: PageState.loaded(data: value.data)));
    });
  }

  FutureOr<void> _onChangePasswordEvent(
      ChangePasswordEvent event, Emitter<SettingState> emit) async {
    emit(state.copyWith(changePasswordStatus: const BlocStatus.loading()));
    final result = await changePasswordUseCase(event.params);
    result.fold((exception, message) {
      emit(state.copyWith(
          changePasswordStatus: BlocStatus.fail(error: message)));
    }, (value) {
      emit(state.copyWith(
          changePasswordStatus: const BlocStatus.success(),
          profileMe: PageState.loaded(data: value.data.user)));
    });
  }

  FutureOr<void> _onGetCitiesEvent(
      GetCitiesEvent event, Emitter<SettingState> emit) async {
    emit(state.copyWith(citiesState: const PageState.loading()));
    final result = await getCitiesUseCase(NoParams());
    result.fold((exception, message) {
      emit(state.copyWith(citiesState: PageState.error(exception: exception)));
    }, (value) {
      emit(state.copyWith(citiesState: PageState.loaded(data: value.data)));
    });
  }
}
