import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/model/product_model.dart';
import 'package:recogenie_task/domain/repo_contract/cart_repo.dart';

@injectable
class AddToCardUsecase {
  @factoryMethod
  AddToCardUsecase(this._cartRepo);
  final CartRepo _cartRepo;

  Future<Result<void>> call(ProductModel product) =>
      _cartRepo.addToCart(product);
}
