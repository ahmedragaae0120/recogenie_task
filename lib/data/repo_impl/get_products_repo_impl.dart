import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/data_source_contract/get_products_datasource.dart';
import 'package:recogenie_task/data/model/product_model.dart';
import 'package:recogenie_task/domain/repo_contract/get_products_repo.dart';

@Injectable(as: GetProductsRepo)
class GetProductsRepoImpl implements GetProductsRepo {
  @factoryMethod
  GetProductsRepoImpl(this._getProductsDatasource);

  final GetProductsDatasource _getProductsDatasource;

  @override
  Future<Result<List<ProductModel>>> getProducts() {
    return _getProductsDatasource.getProducts();
  }
}
