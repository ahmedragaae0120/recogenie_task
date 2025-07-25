import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/domain/repo_contract/register_repo.dart';

@injectable
class RegisterUsecase {
  @factoryMethod
  RegisterUsecase(this._registerRepo);
  final RegisterRepo _registerRepo;

  Future<Result<void>> call({
    required String email,
    required String password,
  }) {
    return _registerRepo.register(
      email: email,
      password: password,
    );
  }
}
