import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/domain/repo_contract/cart_repo.dart';

@injectable
class RemoveFromCartUsecase {
  @factoryMethod
  RemoveFromCartUsecase(this._cartRepo);
  final CartRepo _cartRepo;

  Future<Result<void>> call(String productId) =>
      _cartRepo.removeFromCart(productId);
}
