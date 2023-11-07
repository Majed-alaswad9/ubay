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
    as _i18;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i20;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i19;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i31;
import '../../features/auth/domain/usecases/signup_use_case.dart' as _i32;
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart' as _i33;
import '../../features/posts/data/datasources/home_datasource.dart' as _i12;
import '../../features/posts/data/repository/home_repository_implement.dart'
    as _i14;
import '../../features/posts/domain/repository/home_repository.dart' as _i13;
import '../../features/posts/domain/usecases/add_like_use_case.dart' as _i16;
import '../../features/posts/domain/usecases/comment_use_case/add_comment_use_case.dart'
    as _i15;
import '../../features/posts/domain/usecases/comment_use_case/delete_comment_use_case.dart'
    as _i21;
import '../../features/posts/domain/usecases/comment_use_case/edit_comment_use_case.dart'
    as _i24;
import '../../features/posts/domain/usecases/comment_use_case/get_comments_use_case.dart'
    as _i28;
import '../../features/posts/domain/usecases/delete_like_use_case.dart' as _i22;
import '../../features/posts/domain/usecases/product_use_case/add_post_use_case.dart'
    as _i17;
import '../../features/posts/domain/usecases/product_use_case/delete_product_use_case.dart'
    as _i23;
import '../../features/posts/domain/usecases/product_use_case/edit_product_use_case.dart'
    as _i25;
import '../../features/posts/domain/usecases/product_use_case/get_all_posts_use_case.dart'
    as _i26;
import '../../features/posts/domain/usecases/product_use_case/get_category_use_case.dart'
    as _i27;
import '../../features/posts/domain/usecases/product_use_case/get_store_use_case.dart'
    as _i29;
import '../../features/posts/presintation/bloc/home_bloc.dart' as _i30;
import '../api/client.dart' as _i11;
import '../network_info.dart' as _i6;
import 'di_container.dart' as _i34;

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
  gh.factory<_i15.AddCommentUseCase>(
      () => _i15.AddCommentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i16.AddLikeUseCase>(
      () => _i16.AddLikeUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i17.AddPostUseCase>(
      () => _i17.AddPostUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i18.AuthRemoteDataSource>(
      () => _i18.AuthRemoteDataSource(clientApi: gh<_i11.ClientApi>()));
  gh.factory<_i19.AuthRepository>(() => _i20.AuthRepositoryImplement(
      authRemoteDataSource: gh<_i18.AuthRemoteDataSource>()));
  gh.factory<_i21.DeleteCommentUseCase>(
      () => _i21.DeleteCommentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i22.DeleteLikeUseCase>(
      () => _i22.DeleteLikeUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i23.DeleteProductUseCase>(
      () => _i23.DeleteProductUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i24.EditCommentUseCase>(
      () => _i24.EditCommentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i25.EditProductUseCase>(
      () => _i25.EditProductUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i26.GetAllPostsUseCase>(
      () => _i26.GetAllPostsUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i27.GetCategoryUseCase>(
      () => _i27.GetCategoryUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i28.GetCommentsUseCase>(
      () => _i28.GetCommentsUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i29.GetStoreUseCase>(
      () => _i29.GetStoreUseCase(gh<_i13.HomeRepository>()));
  gh.lazySingleton<_i30.HomeBloc>(() => _i30.HomeBloc(
        gh<_i26.GetAllPostsUseCase>(),
        gh<_i16.AddLikeUseCase>(),
        gh<_i22.DeleteLikeUseCase>(),
        gh<_i29.GetStoreUseCase>(),
        gh<_i27.GetCategoryUseCase>(),
        gh<_i17.AddPostUseCase>(),
        gh<_i28.GetCommentsUseCase>(),
        gh<_i15.AddCommentUseCase>(),
        gh<_i25.EditProductUseCase>(),
        gh<_i21.DeleteCommentUseCase>(),
        gh<_i24.EditCommentUseCase>(),
        gh<_i23.DeleteProductUseCase>(),
      ));
  gh.factory<_i31.LoginUseCase>(
      () => _i31.LoginUseCase(gh<_i19.AuthRepository>()));
  gh.factory<_i32.SignUpUseCase>(
      () => _i32.SignUpUseCase(gh<_i19.AuthRepository>()));
  gh.factory<_i33.AuthBloc>(() => _i33.AuthBloc(
        gh<_i31.LoginUseCase>(),
        gh<_i32.SignUpUseCase>(),
      ));
  return getIt;
}

class _$AppModule extends _i34.AppModule {}
