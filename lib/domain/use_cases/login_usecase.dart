import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/domain/repo_contract/login_repo.dart';

@injectable
class LoginUseCase {
  @factoryMethod
  LoginUseCase(this._loginRepo);
  final LoginRepo _loginRepo;

  Future<Result<void>> call({
    required String email,
    required String password,
  }) {
    return _loginRepo.login(email: email, password: password);
  }
}
