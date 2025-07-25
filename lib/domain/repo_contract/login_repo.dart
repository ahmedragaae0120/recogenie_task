import 'package:recogenie_task/core/result.dart';

abstract interface class LoginRepo {
  Future<Result<void>> login({
    required String email,
    required String password,
  });
}
