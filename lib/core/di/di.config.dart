// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:recogenie_task/core/services/firebase_manager.dart';
import 'package:recogenie_task/data/data_source_impl/get_products_datasource_impl.dart';
import 'package:recogenie_task/data/data_source_impl/login_datasource_impl.dart';
import 'package:recogenie_task/data/data_source_impl/register_datasource_impl.dart';

import '../../data/data_source_contract/auth/login_datasource.dart' as _i1048;
import '../../data/data_source_contract/auth/register_datasource.dart' as _i504;
import '../../data/data_source_contract/cart_datasource.dart' as _i823;
import '../../data/data_source_contract/get_products_datasource.dart' as _i651;
import '../../data/data_source_impl/cart_datasource_impl.dart' as _i1012;
import '../../data/repo_impl/cart_repo_impl.dart' as _i372;
import '../../data/repo_impl/get_products_repo_impl.dart' as _i75;
import '../../data/repo_impl/login_repo_impl.dart' as _i886;
import '../../data/repo_impl/register_repo_impl.dart' as _i357;
import '../../domain/repo_contract/cart_repo.dart' as _i9;
import '../../domain/repo_contract/get_products_repo.dart' as _i1052;
import '../../domain/repo_contract/login_repo.dart' as _i496;
import '../../domain/repo_contract/register_repo.dart' as _i513;
import '../../domain/use_cases/add_to_card_usecase.dart' as _i467;
import '../../domain/use_cases/get_cart_items_usecase.dart' as _i156;
import '../../domain/use_cases/get_products_usecase.dart' as _i852;
import '../../domain/use_cases/login_usecase.dart' as _i645;
import '../../domain/use_cases/register_usecase.dart' as _i328;
import '../../domain/use_cases/remove_from_cart_usecase.dart' as _i599;
import '../../ui/auth/view_model/auth_cubit.dart' as _i538;
import '../../ui/tabs/cart/view_model/cart_cubit.dart' as _i773;
import '../../ui/tabs/menu/view_model/menu_cubit.dart' as _i244;
import '../services/firebase_manager.dart' as _i1025;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1025.FirebaseManager>(() => _i1025.FirebaseManager());
    gh.factory<_i1048.LoginDatasource>(
        () => LoginDatasourceImpl(gh<FirebaseManager>()));
    gh.factory<_i504.RegisterDatasource>(
        () => RegisterDatasourceImpl(gh<FirebaseManager>()));
    gh.factory<_i651.GetProductsDatasource>(
        () => GetProductsDatasourceImpl(gh<FirebaseManager>()));
    gh.factory<_i823.CartDatasource>(
        () => _i1012.CartDatasourceImpl(gh<_i1025.FirebaseManager>()));
    gh.factory<_i1052.GetProductsRepo>(
        () => _i75.GetProductsRepoImpl(gh<_i651.GetProductsDatasource>()));
    gh.factory<_i513.RegisterRepo>(
        () => _i357.RegisterRepoImpl(gh<_i504.RegisterDatasource>()));
    gh.factory<_i852.GetPorductsUsecase>(
        () => _i852.GetPorductsUsecase(gh<_i1052.GetProductsRepo>()));
    gh.factory<_i496.LoginRepo>(
        () => _i886.LoginRepoImpl(gh<_i1048.LoginDatasource>()));
    gh.factory<_i9.CartRepo>(
        () => _i372.CartRepoImpl(gh<_i823.CartDatasource>()));
    gh.factory<_i467.AddToCardUsecase>(
        () => _i467.AddToCardUsecase(gh<_i9.CartRepo>()));
    gh.factory<_i156.GetCartItemsUsecase>(
        () => _i156.GetCartItemsUsecase(gh<_i9.CartRepo>()));
    gh.factory<_i599.RemoveFromCartUsecase>(
        () => _i599.RemoveFromCartUsecase(gh<_i9.CartRepo>()));
    gh.factory<_i645.LoginUseCase>(
        () => _i645.LoginUseCase(gh<_i496.LoginRepo>()));
    gh.factory<_i328.RegisterUsecase>(
        () => _i328.RegisterUsecase(gh<_i513.RegisterRepo>()));
    gh.factory<_i773.CartCubit>(() => _i773.CartCubit(
          gh<_i156.GetCartItemsUsecase>(),
          gh<_i467.AddToCardUsecase>(),
          gh<_i599.RemoveFromCartUsecase>(),
        ));
    gh.factory<_i244.MenuCubit>(
        () => _i244.MenuCubit(gh<_i852.GetPorductsUsecase>()));
    gh.factory<_i538.AuthCubit>(() => _i538.AuthCubit(
          gh<_i645.LoginUseCase>(),
          gh<_i328.RegisterUsecase>(),
        ));
    return this;
  }
}
