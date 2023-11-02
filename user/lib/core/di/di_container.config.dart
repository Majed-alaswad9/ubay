// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../features/app/data/prefs_repository_imp.dart' as _i10;
import '../../features/app/domain/repository/prefs_repository.dart' as _i9;
import '../../features/app/presentation/bloc/app_bloc.dart' as _i3;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i16;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i18;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i17;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i24;
import '../../features/auth/domain/usecases/signup_use_case.dart' as _i25;
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart' as _i26;
import '../../features/posts/data/datasources/home_datasource.dart' as _i12;
import '../../features/posts/data/repository/home_repository_implement.dart'
    as _i14;
import '../../features/posts/domain/repository/home_repository.dart' as _i13;
import '../../features/posts/domain/usecases/add_like_use_case.dart' as _i15;
import '../../features/posts/domain/usecases/delete_like_use_case.dart' as _i19;
import '../../features/posts/domain/usecases/get_all_posts_use_case.dart'
    as _i20;
import '../../features/posts/domain/usecases/get_category_use_case.dart'
    as _i21;
import '../../features/posts/domain/usecases/get_store_use_case.dart' as _i22;
import '../../features/posts/presintation/bloc/home_bloc.dart' as _i23;
import '../api/client.dart' as _i11;
import '../network_info.dart' as _i6;
import 'di_container.dart' as _i27;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AppCubit>(() => _i3.AppCubit());
  gh.factory<_i4.BaseOptions>(() => appModule.dioOption);
  gh.singleton<_i5.Logger>(appModule.logger);
  gh.factory<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImplement(gh<_i7.InternetConnectionChecker>()));
  await gh.singletonAsync<_i8.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i4.Dio>(() => appModule.dio(
        gh<_i4.BaseOptions>(),
        gh<_i5.Logger>(),
      ));
  gh.factory<_i9.PrefsRepository>(() =>
      _i10.PrefsRepositoryImpl(sharedPreferences: gh<_i8.SharedPreferences>()));
  gh.factory<_i11.ClientApi>(() => _i11.ClientApi(gh<_i4.Dio>()));
  gh.factory<_i12.HomeDataSource>(
      () => _i12.HomeDataSource(gh<_i11.ClientApi>()));
  gh.factory<_i13.HomeRepository>(
      () => _i14.HomeRepositoryImplement(gh<_i12.HomeDataSource>()));
  gh.factory<_i15.AddLikeUseCase>(
      () => _i15.AddLikeUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i16.AuthRemoteDataSource>(
      () => _i16.AuthRemoteDataSource(clientApi: gh<_i11.ClientApi>()));
  gh.factory<_i17.AuthRepository>(() => _i18.AuthRepositoryImplement(
      authRemoteDataSource: gh<_i16.AuthRemoteDataSource>()));
  gh.factory<_i19.DeleteLikeUseCase>(
      () => _i19.DeleteLikeUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i20.GetAllPostsUseCase>(
      () => _i20.GetAllPostsUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i21.GetCategoryUseCase>(
      () => _i21.GetCategoryUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i22.GetStoreUseCase>(
      () => _i22.GetStoreUseCase(gh<_i13.HomeRepository>()));
  gh.lazySingleton<_i23.HomeBloc>(() => _i23.HomeBloc(
        gh<_i20.GetAllPostsUseCase>(),
        gh<_i15.AddLikeUseCase>(),
        gh<_i19.DeleteLikeUseCase>(),
        gh<_i22.GetStoreUseCase>(),
        gh<_i21.GetCategoryUseCase>(),
      ));
  gh.factory<_i24.LoginUseCase>(
      () => _i24.LoginUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i25.SignUpUseCase>(
      () => _i25.SignUpUseCase(gh<_i17.AuthRepository>()));
  gh.factory<_i26.AuthBloc>(() => _i26.AuthBloc(
        gh<_i24.LoginUseCase>(),
        gh<_i25.SignUpUseCase>(),
      ));
  return getIt;
}

class _$AppModule extends _i27.AppModule {}
