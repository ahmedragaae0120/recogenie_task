import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/model/product_model.dart';

abstract interface class GetProductsRepo {
  Future<Result<List<ProductModel>>> getProducts();
}
