import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/data_source_contract/cart_datasource.dart';
import 'package:recogenie_task/data/model/product_model.dart';
import 'package:recogenie_task/domain/repo_contract/cart_repo.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  @factoryMethod
  CartRepoImpl(this._cartDatasource);

  final CartDatasource _cartDatasource;

  @override
  Future<Result<void>> addToCart(ProductModel product) {
    return _cartDatasource.addToCart(product);
  }

  @override
  Future<Result<void>> removeFromCart(String productId) {
    return _cartDatasource.removeFromCart(productId);
  }

  @override
  Future<Result<List<ProductModel>>> getCartItems() {
    return _cartDatasource.getCartItems();
  }
}
