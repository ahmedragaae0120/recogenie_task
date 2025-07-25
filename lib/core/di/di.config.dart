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

import '../../data/data_source_contract/auth/login_datasource.dart' as _i1048;
import '../../data/data_source_contract/auth/register_datasource.dart' as _i504;
import '../../data/data_source_impl/login_datasource_impl.dart' as _i954;
import '../../data/data_source_impl/register_datasource_impl.dart' as _i77;
import '../../data/repo_impl/login_repo_impl.dart' as _i886;
import '../../data/repo_impl/register_repo_impl.dart' as _i357;
import '../../domain/repo_contract/login_repo.dart' as _i496;
import '../../domain/repo_contract/register_repo.dart' as _i513;
import '../../domain/use_cases/login_usecase.dart' as _i645;
import '../../domain/use_cases/register_usecase.dart' as _i328;
import '../../ui/auth/view_model/auth_cubit.dart' as _i538;
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
        () => _i954.LoginDatasourceImpl(gh<_i1025.FirebaseManager>()));
    gh.factory<_i504.RegisterDatasource>(
        () => _i77.RegisterDatasourceImpl(gh<_i1025.FirebaseManager>()));
    gh.factory<_i513.RegisterRepo>(
        () => _i357.RegisterRepoImpl(gh<_i504.RegisterDatasource>()));
    gh.factory<_i496.LoginRepo>(
        () => _i886.LoginRepoImpl(gh<_i1048.LoginDatasource>()));
    gh.factory<_i645.LoginUseCase>(
        () => _i645.LoginUseCase(gh<_i496.LoginRepo>()));
    gh.factory<_i328.RegisterUsecase>(
        () => _i328.RegisterUsecase(gh<_i513.RegisterRepo>()));
    gh.factory<_i538.AuthCubit>(() => _i538.AuthCubit(
          gh<_i645.LoginUseCase>(),
          gh<_i328.RegisterUsecase>(),
        ));
    return this;
  }
}
