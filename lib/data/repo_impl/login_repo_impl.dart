import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/data_source_contract/auth/login_datasource.dart';
import 'package:recogenie_task/domain/repo_contract/login_repo.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  @factoryMethod
  LoginRepoImpl(this._loginDatasource);

  final LoginDatasource _loginDatasource;

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) {
    return _loginDatasource.login(email: email, password: password);
  }
}
