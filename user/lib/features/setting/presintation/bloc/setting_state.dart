part of 'setting_bloc.dart';

@immutable
class SettingState {
  final PageState<UserModel> profileMe;
  final PageState<CategoryModel> citiesState;
  final BlocStatus updateProfile;
  final File? photo;
  final BlocStatus changePasswordStatus;

  const SettingState(
      {this.profileMe = const PageState.init(),
      this.citiesState = const PageState.init(),
      this.updateProfile = const BlocStatus.initial(),
      this.photo,
      this.changePasswordStatus = const BlocStatus.initial()});

  SettingState copyWith(
      {final PageState<UserModel>? profileMe,
      final PageState<CategoryModel>? citiesState,
      final BlocStatus? updateProfile,
      final File? photo,
      final BlocStatus? changePasswordStatus}) {
    return SettingState(
        profileMe: profileMe ?? this.profileMe,
        citiesState: citiesState ?? this.citiesState,
        updateProfile: updateProfile ?? this.updateProfile,
        photo: photo,
        changePasswordStatus:
            changePasswordStatus ?? this.changePasswordStatus);
  }
}
