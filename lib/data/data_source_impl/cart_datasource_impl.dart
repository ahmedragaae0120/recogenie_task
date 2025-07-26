import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/core/services/firebase_manager.dart';
import 'package:recogenie_task/data/data_source_contract/cart_datasource.dart';
import 'package:recogenie_task/data/model/product_model.dart';

@Injectable(as: CartDatasource)
class CartDatasourceImpl implements CartDatasource {
  @factoryMethod
  CartDatasourceImpl(this._firebaseManager);
  final FirebaseManager _firebaseManager;
  @override
  Future<Result<void>> addToCart(ProductModel product) async {
    try {
      await _firebaseManager.addToCart(product);
      return Success<void>(null);
    } catch (e) {
      return Error(Exception('Failed to add product to cart: $e'));
    }
  }

  @override
  Future<Result<List<ProductModel>>> getCartItems() async {
    try {
      final productList = await _firebaseManager.getCartItems();
      return Success<List<ProductModel>>(productList);
    } catch (e) {
      return Error(Exception('Failed to fetch cart items: $e'));
    }
  }

  @override
  Future<Result<void>> removeFromCart(String productId) async {
    try {
      await _firebaseManager.removeFromCart(productId);
      return Success<void>(null);
    } catch (e) {
      return Error(Exception('Failed to remove product from cart: $e'));
    }
  }
}
