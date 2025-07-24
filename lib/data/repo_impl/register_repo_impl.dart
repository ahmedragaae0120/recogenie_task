import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/data_source_contract/auth/register_datasource.dart';
import 'package:recogenie_task/domain/repo_contract/register_repo.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo {
  @factoryMethod
  RegisterRepoImpl(this._registerDatasource);

  final RegisterDatasource _registerDatasource;

  @override
  Future<Result<void>> register({
    required String email,
    required String password,
  }) {
    return _registerDatasource.register(email: email, password: password);
  }
}
