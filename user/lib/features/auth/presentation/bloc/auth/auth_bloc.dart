import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:user/core/common/model/page_state/bloc_status.dart';
import 'package:user/features/auth/domain/usecases/signup_use_case.dart';

import '../../../domain/usecases/login_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc(this.loginUseCase, this.signUpUseCase) : super(const AuthState()) {
    on<LoginEvent>(_onLoginEvent);
    on<SignupEvent>(_onSignUpEvent);
  }

  FutureOr<void> _onLoginEvent(
      LoginEvent loginEvent, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginStatus: const BlocStatus.loading()));
    final result =
        await loginUseCase(LoginParams(loginEvent.email, loginEvent.password));
    result.fold(
        (exception, message) =>
            emit(state.copyWith(loginStatus: BlocStatus.fail(error: message))),
        (value) =>
            emit(state.copyWith(loginStatus: const BlocStatus.success())));
  }

  FutureOr<void> _onSignUpEvent(
      SignupEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signUpStatus: const BlocStatus.loading()));
    final result = await signUpUseCase(SignUpParams(
        event.name, event.email, event.password, event.confirmPassword));
    result.fold(
        (exception, message) =>
            emit(state.copyWith(signUpStatus: BlocStatus.fail(error: message))),
        (value) =>
            emit(state.copyWith(signUpStatus: const BlocStatus.success())));
  }
}
