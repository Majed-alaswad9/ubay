part of 'setting_bloc.dart';

@immutable
abstract class SettingEvent {}

class GetMeEvent extends SettingEvent {}

class PickPhotoEvent extends SettingEvent {
  final ImageSource imageSource;

  PickPhotoEvent(this.imageSource);
}

class EditMyProfileEvent extends SettingEvent {
  final String? name;
  final String? email;

  EditMyProfileEvent({this.name, this.email});
}

class ChangePasswordEvent extends SettingEvent {
  final ChangePasswordParams params;

  ChangePasswordEvent(this.params);
}

class GetCitiesEvent extends SettingEvent {}
