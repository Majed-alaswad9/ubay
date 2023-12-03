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
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../features/app/data/prefs_repository_imp.dart' as _i13;
import '../../features/app/domain/repository/prefs_repository.dart' as _i12;
import '../../features/app/presentation/bloc/app_bloc.dart' as _i3;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i25;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i27;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i26;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i45;
import '../../features/auth/domain/usecases/signup_use_case.dart' as _i46;
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart' as _i48;
import '../../features/chat/data/datasources/chat_data_source.dart' as _i28;
import '../../features/chat/data/repository/chat_repository_implement.dart'
    as _i30;
import '../../features/chat/domain/repository/chat_repository.dart' as _i29;
import '../../features/chat/domain/usecase/get_chats_use_case.dart' as _i38;
import '../../features/chat/domain/usecase/get_messages_use_case.dart' as _i40;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i49;
import '../../features/my_transactions/data/datasources/transactions_data_source.dart'
    as _i19;
import '../../features/my_transactions/data/repository/transactions_repository_impl.dart'
    as _i21;
import '../../features/my_transactions/domain/repository/transactions_repository.dart'
    as _i20;
import '../../features/my_transactions/domain/usecases/get_purchases_use_case.dart'
    as _i41;
import '../../features/my_transactions/domain/usecases/get_sales_use_case.dart'
    as _i42;
import '../../features/my_transactions/presintation/bloc/transactions_bloc.dart'
    as _i47;
import '../../features/products/data/datasources/home_datasource.dart' as _i15;
import '../../features/products/data/repository/home_repository_implement.dart'
    as _i17;
import '../../features/products/domain/repository/home_repository.dart' as _i16;
import '../../features/products/domain/usecases/add_like_use_case.dart' as _i23;
import '../../features/products/domain/usecases/comment_use_case/add_comment_use_case.dart'
    as _i22;
import '../../features/products/domain/usecases/comment_use_case/delete_comment_use_case.dart'
    as _i31;
import '../../features/products/domain/usecases/comment_use_case/edit_comment_use_case.dart'
    as _i34;
import '../../features/products/domain/usecases/comment_use_case/get_comments_use_case.dart'
    as _i39;
import '../../features/products/domain/usecases/delete_like_use_case.dart'
    as _i32;
import '../../features/products/domain/usecases/product_use_case/add_post_use_case.dart'
    as _i24;
import '../../features/products/domain/usecases/product_use_case/delete_product_use_case.dart'
    as _i33;
import '../../features/products/domain/usecases/product_use_case/edit_product_use_case.dart'
    as _i35;
import '../../features/products/domain/usecases/product_use_case/get_all_posts_use_case.dart'
    as _i36;
import '../../features/products/domain/usecases/product_use_case/get_category_use_case.dart'
    as _i37;
import '../../features/products/domain/usecases/product_use_case/get_store_use_case.dart'
    as _i43;
import '../../features/products/presintation/bloc/home_bloc.dart' as _i44;
import '../../features/setting/data/datasources/setting_datasource.dart'
    as _i18;
import '../../features/setting/data/repository/setting_repository_impl.dart'
    as _i9;
import '../../features/setting/domain/repository/setting_repository.dart'
    as _i8;
import '../../features/setting/domain/usecase/get_me_use_case.dart' as _i11;
import '../api/client.dart' as _i14;
import '../network_info.dart' as _i6;
import 'di_container.dart' as _i50;

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
  gh.factory<_i8.SettingRepository>(() => _i9.SettingRepositoryImplement());
  await gh.singletonAsync<_i10.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i4.Dio>(() => appModule.dio(
        gh<_i4.BaseOptions>(),
        gh<_i5.Logger>(),
      ));
  gh.factory<_i11.GetNeUseCase>(
      () => _i11.GetNeUseCase(gh<_i8.SettingRepository>()));
  gh.factory<_i12.PrefsRepository>(() => _i13.PrefsRepositoryImpl(
      sharedPreferences: gh<_i10.SharedPreferences>()));
  gh.factory<_i14.ClientApi>(() => _i14.ClientApi(gh<_i4.Dio>()));
  gh.factory<_i15.HomeDataSource>(
      () => _i15.HomeDataSource(gh<_i14.ClientApi>()));
  gh.factory<_i16.HomeRepository>(
      () => _i17.HomeRepositoryImplement(gh<_i15.HomeDataSource>()));
  gh.factory<_i18.SettingDataSource>(
      () => _i18.SettingDataSource(gh<_i14.ClientApi>()));
  gh.factory<_i19.TransactionsDataSource>(
      () => _i19.TransactionsDataSource(gh<_i14.ClientApi>()));
  gh.factory<_i20.TransactionsRepository>(() =>
      _i21.TransactionsRepositoryImplement(gh<_i19.TransactionsDataSource>()));
  gh.factory<_i22.AddCommentUseCase>(
      () => _i22.AddCommentUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i23.AddLikeUseCase>(
      () => _i23.AddLikeUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i24.AddPostUseCase>(
      () => _i24.AddPostUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i25.AuthRemoteDataSource>(
      () => _i25.AuthRemoteDataSource(clientApi: gh<_i14.ClientApi>()));
  gh.factory<_i26.AuthRepository>(() => _i27.AuthRepositoryImplement(
      authRemoteDataSource: gh<_i25.AuthRemoteDataSource>()));
  gh.factory<_i28.ChatDataSource>(
      () => _i28.ChatDataSource(gh<_i14.ClientApi>()));
  gh.factory<_i29.ChatRepository>(
      () => _i30.ChatRepositoryImplement(gh<_i28.ChatDataSource>()));
  gh.factory<_i31.DeleteCommentUseCase>(
      () => _i31.DeleteCommentUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i32.DeleteLikeUseCase>(
      () => _i32.DeleteLikeUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i33.DeleteProductUseCase>(
      () => _i33.DeleteProductUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i34.EditCommentUseCase>(
      () => _i34.EditCommentUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i35.EditProductUseCase>(
      () => _i35.EditProductUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i36.GetAllPostsUseCase>(
      () => _i36.GetAllPostsUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i37.GetCategoryUseCase>(
      () => _i37.GetCategoryUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i38.GetChatsUseCase>(
      () => _i38.GetChatsUseCase(gh<_i29.ChatRepository>()));
  gh.factory<_i39.GetCommentsUseCase>(
      () => _i39.GetCommentsUseCase(gh<_i16.HomeRepository>()));
  gh.factory<_i40.GetMessagesUseCase>(
      () => _i40.GetMessagesUseCase(gh<_i29.ChatRepository>()));
  gh.factory<_i41.GetMyPurchasesUseCase>(
      () => _i41.GetMyPurchasesUseCase(gh<_i20.TransactionsRepository>()));
  gh.factory<_i42.GetMySalesUseCase>(
      () => _i42.GetMySalesUseCase(gh<_i20.TransactionsRepository>()));
  gh.factory<_i43.GetStoreUseCase>(
      () => _i43.GetStoreUseCase(gh<_i16.HomeRepository>()));
  gh.lazySingleton<_i44.HomeBloc>(() => _i44.HomeBloc(
        gh<_i36.GetAllPostsUseCase>(),
        gh<_i23.AddLikeUseCase>(),
        gh<_i32.DeleteLikeUseCase>(),
        gh<_i43.GetStoreUseCase>(),
        gh<_i37.GetCategoryUseCase>(),
        gh<_i24.AddPostUseCase>(),
        gh<_i39.GetCommentsUseCase>(),
        gh<_i22.AddCommentUseCase>(),
        gh<_i35.EditProductUseCase>(),
        gh<_i31.DeleteCommentUseCase>(),
        gh<_i34.EditCommentUseCase>(),
        gh<_i33.DeleteProductUseCase>(),
      ));
  gh.factory<_i45.LoginUseCase>(
      () => _i45.LoginUseCase(gh<_i26.AuthRepository>()));
  gh.factory<_i46.SignUpUseCase>(
      () => _i46.SignUpUseCase(gh<_i26.AuthRepository>()));
  gh.lazySingleton<_i47.TransactionsBloc>(() => _i47.TransactionsBloc(
        gh<_i42.GetMySalesUseCase>(),
        gh<_i41.GetMyPurchasesUseCase>(),
      ));
  gh.factory<_i48.AuthBloc>(() => _i48.AuthBloc(
        gh<_i45.LoginUseCase>(),
        gh<_i46.SignUpUseCase>(),
      ));
  gh.lazySingleton<_i49.ChatBloc>(() => _i49.ChatBloc(
        gh<_i38.GetChatsUseCase>(),
        gh<_i40.GetMessagesUseCase>(),
      ));
  return getIt;
}

class _$AppModule extends _i50.AppModule {}
