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
    as _i21;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i23;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i22;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i40;
import '../../features/auth/domain/usecases/signup_use_case.dart' as _i41;
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart' as _i43;
import '../../features/chat/data/datasources/chat_data_source.dart' as _i24;
import '../../features/chat/data/repository/chat_repository_implement.dart'
    as _i26;
import '../../features/chat/domain/repository/chat_repository.dart' as _i25;
import '../../features/chat/domain/usecase/get_chats_use_case.dart' as _i34;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i44;
import '../../features/my_transactions/data/datasources/transactions_data_source.dart'
    as _i15;
import '../../features/my_transactions/data/repository/transactions_repository_impl.dart'
    as _i17;
import '../../features/my_transactions/domain/repository/transactions_repository.dart'
    as _i16;
import '../../features/my_transactions/domain/usecases/get_purchases_use_case.dart'
    as _i36;
import '../../features/my_transactions/domain/usecases/get_sales_use_case.dart'
    as _i37;
import '../../features/my_transactions/presintation/bloc/transactions_bloc.dart'
    as _i42;
import '../../features/products/data/datasources/home_datasource.dart' as _i12;
import '../../features/products/data/repository/home_repository_implement.dart'
    as _i14;
import '../../features/products/domain/repository/home_repository.dart' as _i13;
import '../../features/products/domain/usecases/add_like_use_case.dart' as _i19;
import '../../features/products/domain/usecases/comment_use_case/add_comment_use_case.dart'
    as _i18;
import '../../features/products/domain/usecases/comment_use_case/delete_comment_use_case.dart'
    as _i27;
import '../../features/products/domain/usecases/comment_use_case/edit_comment_use_case.dart'
    as _i30;
import '../../features/products/domain/usecases/comment_use_case/get_comments_use_case.dart'
    as _i35;
import '../../features/products/domain/usecases/delete_like_use_case.dart'
    as _i28;
import '../../features/products/domain/usecases/product_use_case/add_post_use_case.dart'
    as _i20;
import '../../features/products/domain/usecases/product_use_case/delete_product_use_case.dart'
    as _i29;
import '../../features/products/domain/usecases/product_use_case/edit_product_use_case.dart'
    as _i31;
import '../../features/products/domain/usecases/product_use_case/get_all_posts_use_case.dart'
    as _i32;
import '../../features/products/domain/usecases/product_use_case/get_category_use_case.dart'
    as _i33;
import '../../features/products/domain/usecases/product_use_case/get_store_use_case.dart'
    as _i38;
import '../../features/products/presintation/bloc/home_bloc.dart' as _i39;
import '../api/client.dart' as _i11;
import '../network_info.dart' as _i6;
import 'di_container.dart' as _i45;

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
  gh.factory<_i15.TransactionsDataSource>(
      () => _i15.TransactionsDataSource(gh<_i11.ClientApi>()));
  gh.factory<_i16.TransactionsRepository>(() =>
      _i17.TransactionsRepositoryImplement(gh<_i15.TransactionsDataSource>()));
  gh.factory<_i18.AddCommentUseCase>(
      () => _i18.AddCommentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i19.AddLikeUseCase>(
      () => _i19.AddLikeUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i20.AddPostUseCase>(
      () => _i20.AddPostUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i21.AuthRemoteDataSource>(
      () => _i21.AuthRemoteDataSource(clientApi: gh<_i11.ClientApi>()));
  gh.factory<_i22.AuthRepository>(() => _i23.AuthRepositoryImplement(
      authRemoteDataSource: gh<_i21.AuthRemoteDataSource>()));
  gh.factory<_i24.ChatDataSource>(
      () => _i24.ChatDataSource(gh<_i11.ClientApi>()));
  gh.factory<_i25.ChatRepository>(
      () => _i26.ChatRepositoryImplement(gh<_i24.ChatDataSource>()));
  gh.factory<_i27.DeleteCommentUseCase>(
      () => _i27.DeleteCommentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i28.DeleteLikeUseCase>(
      () => _i28.DeleteLikeUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i29.DeleteProductUseCase>(
      () => _i29.DeleteProductUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i30.EditCommentUseCase>(
      () => _i30.EditCommentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i31.EditProductUseCase>(
      () => _i31.EditProductUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i32.GetAllPostsUseCase>(
      () => _i32.GetAllPostsUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i33.GetCategoryUseCase>(
      () => _i33.GetCategoryUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i34.GetChatsUseCase>(
      () => _i34.GetChatsUseCase(gh<_i25.ChatRepository>()));
  gh.factory<_i35.GetCommentsUseCase>(
      () => _i35.GetCommentsUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i36.GetMyPurchasesUseCase>(
      () => _i36.GetMyPurchasesUseCase(gh<_i16.TransactionsRepository>()));
  gh.factory<_i37.GetMySalesUseCase>(
      () => _i37.GetMySalesUseCase(gh<_i16.TransactionsRepository>()));
  gh.factory<_i38.GetStoreUseCase>(
      () => _i38.GetStoreUseCase(gh<_i13.HomeRepository>()));
  gh.lazySingleton<_i39.HomeBloc>(() => _i39.HomeBloc(
        gh<_i32.GetAllPostsUseCase>(),
        gh<_i19.AddLikeUseCase>(),
        gh<_i28.DeleteLikeUseCase>(),
        gh<_i38.GetStoreUseCase>(),
        gh<_i33.GetCategoryUseCase>(),
        gh<_i20.AddPostUseCase>(),
        gh<_i35.GetCommentsUseCase>(),
        gh<_i18.AddCommentUseCase>(),
        gh<_i31.EditProductUseCase>(),
        gh<_i27.DeleteCommentUseCase>(),
        gh<_i30.EditCommentUseCase>(),
        gh<_i29.DeleteProductUseCase>(),
      ));
  gh.factory<_i40.LoginUseCase>(
      () => _i40.LoginUseCase(gh<_i22.AuthRepository>()));
  gh.factory<_i41.SignUpUseCase>(
      () => _i41.SignUpUseCase(gh<_i22.AuthRepository>()));
  gh.lazySingleton<_i42.TransactionsBloc>(() => _i42.TransactionsBloc(
        gh<_i37.GetMySalesUseCase>(),
        gh<_i36.GetMyPurchasesUseCase>(),
      ));
  gh.factory<_i43.AuthBloc>(() => _i43.AuthBloc(
        gh<_i40.LoginUseCase>(),
        gh<_i41.SignUpUseCase>(),
      ));
  gh.lazySingleton<_i44.ChatBloc>(
      () => _i44.ChatBloc(gh<_i34.GetChatsUseCase>()));
  return getIt;
}

class _$AppModule extends _i45.AppModule {}
