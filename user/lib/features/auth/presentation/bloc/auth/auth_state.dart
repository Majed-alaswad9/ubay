part of 'auth_bloc.dart';

@immutable
class AuthState {
  final BlocStatus loginStatus;
  final BlocStatus signupStatus;

  const AuthState(
      {this.loginStatus = const BlocStatus.initial(),
      this.signupStatus = const BlocStatus.initial()});

  AuthState copyWith({
    final BlocStatus? loginStatus,
    final BlocStatus? signUpStatus,
  }) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
      signupStatus: signUpStatus ?? signupStatus,
    );
  }
}
