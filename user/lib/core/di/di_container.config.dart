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
    as _i26;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i28;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i27;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i56;
import '../../features/auth/domain/usecases/signup_use_case.dart' as _i58;
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart' as _i61;
import '../../features/chat/data/datasources/chat_data_source.dart' as _i30;
import '../../features/chat/data/repository/chat_repository_implement.dart'
    as _i32;
import '../../features/chat/domain/repository/chat_repository.dart' as _i31;
import '../../features/chat/domain/usecase/add_message_use_case.dart' as _i60;
import '../../features/chat/domain/usecase/delete_chat_use_case.dart' as _i34;
import '../../features/chat/domain/usecase/delete_message_use_case.dart'
    as _i38;
import '../../features/chat/domain/usecase/get_chats_use_case.dart' as _i45;
import '../../features/chat/domain/usecase/get_messages_use_case.dart' as _i50;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i62;
import '../../features/my_transactions/data/datasources/transactions_data_source.dart'
    as _i18;
import '../../features/my_transactions/data/repository/transactions_repository_impl.dart'
    as _i20;
import '../../features/my_transactions/domain/repository/transactions_repository.dart'
    as _i19;
import '../../features/my_transactions/domain/usecases/get_purchases_use_case.dart'
    as _i51;
import '../../features/my_transactions/domain/usecases/get_sales_use_case.dart'
    as _i52;
import '../../features/my_transactions/presintation/bloc/transactions_bloc.dart'
    as _i59;
import '../../features/products/data/datasources/home_datasource.dart' as _i12;
import '../../features/products/data/repository/home_repository_implement.dart'
    as _i14;
import '../../features/products/domain/repository/home_repository.dart' as _i13;
import '../../features/products/domain/usecases/add_like_use_case.dart' as _i23;
import '../../features/products/domain/usecases/comment_use_case/add_comment_use_case.dart'
    as _i21;
import '../../features/products/domain/usecases/comment_use_case/delete_comment_use_case.dart'
    as _i35;
import '../../features/products/domain/usecases/comment_use_case/edit_comment_use_case.dart'
    as _i40;
import '../../features/products/domain/usecases/comment_use_case/get_comments_use_case.dart'
    as _i47;
import '../../features/products/domain/usecases/coupons_use_case/add_coupon_use_case.dart'
    as _i22;
import '../../features/products/domain/usecases/coupons_use_case/delete_coupon_use_case.dart'
    as _i36;
import '../../features/products/domain/usecases/coupons_use_case/get_coupons_use_case.dart'
    as _i48;
import '../../features/products/domain/usecases/create_chat_use_case.dart'
    as _i33;
import '../../features/products/domain/usecases/delete_like_use_case.dart'
    as _i37;
import '../../features/products/domain/usecases/payment_use_case.dart' as _i24;
import '../../features/products/domain/usecases/product_use_case/add_product_use_case.dart'
    as _i25;
import '../../features/products/domain/usecases/product_use_case/delete_product_use_case.dart'
    as _i39;
import '../../features/products/domain/usecases/product_use_case/edit_product_use_case.dart'
    as _i41;
import '../../features/products/domain/usecases/product_use_case/get_all_products_use_case.dart'
    as _i43;
import '../../features/products/domain/usecases/product_use_case/get_category_use_case.dart'
    as _i44;
import '../../features/products/domain/usecases/product_use_case/get_product_use_case.dart'
    as _i53;
import '../../features/products/domain/usecases/product_use_case/get_store_use_case.dart'
    as _i54;
import '../../features/products/presintation/bloc/home_bloc.dart' as _i55;
import '../../features/setting/data/datasources/setting_datasource.dart'
    as _i15;
import '../../features/setting/data/repository/setting_repository_impl.dart'
    as _i17;
import '../../features/setting/domain/repository/setting_repository.dart'
    as _i16;
import '../../features/setting/domain/usecase/change_password_use_case.dart'
    as _i29;
import '../../features/setting/domain/usecase/edit_profile_use_case.dart'
    as _i42;
import '../../features/setting/domain/usecase/get_me_use_case.dart' as _i49;
import '../../features/setting/domain/usecase/git_cities_use_case.dart' as _i46;
import '../../features/setting/presintation/bloc/setting_bloc.dart' as _i57;
import '../api/client.dart' as _i11;
import '../network_info.dart' as _i6;
import 'di_container.dart' as _i63;

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
  gh.factory<_i15.SettingDataSource>(
      () => _i15.SettingDataSource(gh<_i11.ClientApi>()));
  gh.factory<_i16.SettingRepository>(
      () => _i17.SettingRepositoryImplement(gh<_i15.SettingDataSource>()));
  gh.factory<_i18.TransactionsDataSource>(
      () => _i18.TransactionsDataSource(gh<_i11.ClientApi>()));
  gh.factory<_i19.TransactionsRepository>(() =>
      _i20.TransactionsRepositoryImplement(gh<_i18.TransactionsDataSource>()));
  gh.factory<_i21.AddCommentUseCase>(
      () => _i21.AddCommentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i22.AddCouponUseCase>(
      () => _i22.AddCouponUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i23.AddLikeUseCase>(
      () => _i23.AddLikeUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i24.AddPaymentUseCase>(
      () => _i24.AddPaymentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i25.AddProductUseCase>(
      () => _i25.AddProductUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i26.AuthRemoteDataSource>(
      () => _i26.AuthRemoteDataSource(clientApi: gh<_i11.ClientApi>()));
  gh.factory<_i27.AuthRepository>(() => _i28.AuthRepositoryImplement(
      authRemoteDataSource: gh<_i26.AuthRemoteDataSource>()));
  gh.factory<_i29.ChangePasswordUseCase>(
      () => _i29.ChangePasswordUseCase(gh<_i16.SettingRepository>()));
  gh.factory<_i30.ChatDataSource>(
      () => _i30.ChatDataSource(gh<_i11.ClientApi>()));
  gh.factory<_i31.ChatRepository>(
      () => _i32.ChatRepositoryImplement(gh<_i30.ChatDataSource>()));
  gh.factory<_i33.CreateChatUseCase>(
      () => _i33.CreateChatUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i34.DeleteChatUseCase>(
      () => _i34.DeleteChatUseCase(gh<_i31.ChatRepository>()));
  gh.factory<_i35.DeleteCommentUseCase>(
      () => _i35.DeleteCommentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i36.DeleteCouponUseCase>(
      () => _i36.DeleteCouponUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i37.DeleteLikeUseCase>(
      () => _i37.DeleteLikeUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i38.DeleteMessageUseCase>(
      () => _i38.DeleteMessageUseCase(gh<_i31.ChatRepository>()));
  gh.factory<_i39.DeleteProductUseCase>(
      () => _i39.DeleteProductUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i40.EditCommentUseCase>(
      () => _i40.EditCommentUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i41.EditProductUseCase>(
      () => _i41.EditProductUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i42.EditProfileUseCase>(
      () => _i42.EditProfileUseCase(gh<_i16.SettingRepository>()));
  gh.factory<_i43.GetAllPostsUseCase>(
      () => _i43.GetAllPostsUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i44.GetCategoryUseCase>(
      () => _i44.GetCategoryUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i45.GetChatsUseCase>(
      () => _i45.GetChatsUseCase(gh<_i31.ChatRepository>()));
  gh.factory<_i46.GetCitiesUseCase>(
      () => _i46.GetCitiesUseCase(gh<_i16.SettingRepository>()));
  gh.factory<_i47.GetCommentsUseCase>(
      () => _i47.GetCommentsUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i48.GetCouponsUseCase>(
      () => _i48.GetCouponsUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i49.GetMeUseCase>(
      () => _i49.GetMeUseCase(gh<_i16.SettingRepository>()));
  gh.factory<_i50.GetMessagesUseCase>(
      () => _i50.GetMessagesUseCase(gh<_i31.ChatRepository>()));
  gh.factory<_i51.GetMyPurchasesUseCase>(
      () => _i51.GetMyPurchasesUseCase(gh<_i19.TransactionsRepository>()));
  gh.factory<_i52.GetMySalesUseCase>(
      () => _i52.GetMySalesUseCase(gh<_i19.TransactionsRepository>()));
  gh.factory<_i53.GetProductUseCase>(
      () => _i53.GetProductUseCase(gh<_i13.HomeRepository>()));
  gh.factory<_i54.GetStoreUseCase>(
      () => _i54.GetStoreUseCase(gh<_i13.HomeRepository>()));
  gh.lazySingleton<_i55.HomeBloc>(() => _i55.HomeBloc(
        gh<_i43.GetAllPostsUseCase>(),
        gh<_i23.AddLikeUseCase>(),
        gh<_i37.DeleteLikeUseCase>(),
        gh<_i54.GetStoreUseCase>(),
        gh<_i44.GetCategoryUseCase>(),
        gh<_i25.AddProductUseCase>(),
        gh<_i47.GetCommentsUseCase>(),
        gh<_i21.AddCommentUseCase>(),
        gh<_i41.EditProductUseCase>(),
        gh<_i35.DeleteCommentUseCase>(),
        gh<_i40.EditCommentUseCase>(),
        gh<_i39.DeleteProductUseCase>(),
        gh<_i48.GetCouponsUseCase>(),
        gh<_i24.AddPaymentUseCase>(),
        gh<_i22.AddCouponUseCase>(),
        gh<_i36.DeleteCouponUseCase>(),
        gh<_i53.GetProductUseCase>(),
      ));
  gh.factory<_i56.LoginUseCase>(
      () => _i56.LoginUseCase(gh<_i27.AuthRepository>()));
  gh.lazySingleton<_i57.SettingBloc>(() => _i57.SettingBloc(
        gh<_i49.GetMeUseCase>(),
        gh<_i42.EditProfileUseCase>(),
        gh<_i29.ChangePasswordUseCase>(),
        gh<_i46.GetCitiesUseCase>(),
      ));
  gh.factory<_i58.SignUpUseCase>(
      () => _i58.SignUpUseCase(gh<_i27.AuthRepository>()));
  gh.lazySingleton<_i59.TransactionsBloc>(() => _i59.TransactionsBloc(
        gh<_i52.GetMySalesUseCase>(),
        gh<_i51.GetMyPurchasesUseCase>(),
      ));
  gh.factory<_i60.AddMessageUseCase>(
      () => _i60.AddMessageUseCase(gh<_i31.ChatRepository>()));
  gh.lazySingleton<_i61.AuthBloc>(() => _i61.AuthBloc(
        gh<_i56.LoginUseCase>(),
        gh<_i58.SignUpUseCase>(),
      ));
  gh.lazySingleton<_i62.ChatBloc>(() => _i62.ChatBloc(
        gh<_i45.GetChatsUseCase>(),
        gh<_i50.GetMessagesUseCase>(),
        gh<_i60.AddMessageUseCase>(),
        gh<_i38.DeleteMessageUseCase>(),
        gh<_i34.DeleteChatUseCase>(),
      ));
  return getIt;
}

class _$AppModule extends _i63.AppModule {}
