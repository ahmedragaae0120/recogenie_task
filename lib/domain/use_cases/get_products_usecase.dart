import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/model/product_model.dart';
import 'package:recogenie_task/domain/repo_contract/get_products_repo.dart';

@injectable
class GetPorductsUsecase {
  @factoryMethod
  GetPorductsUsecase(this._getProductsRepo);

  final GetProductsRepo _getProductsRepo;

  Future<Result<List<ProductModel>>> call() async {
    return await _getProductsRepo.getProducts();
  }
}
