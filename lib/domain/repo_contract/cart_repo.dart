import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/model/product_model.dart';

abstract interface class CartRepo {
  Future<Result<void>> addToCart(ProductModel product);

  Future<Result<void>> removeFromCart(String productId);

  Future<Result<List<ProductModel>>> getCartItems();
}
