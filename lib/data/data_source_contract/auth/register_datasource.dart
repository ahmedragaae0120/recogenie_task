import 'package:recogenie_task/core/result.dart';

abstract interface class RegisterDatasource {
  Future<Result<void>> register({
    required String email,
    required String password,
  });
}
