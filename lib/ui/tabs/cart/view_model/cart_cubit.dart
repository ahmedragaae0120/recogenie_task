import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/model/product_model.dart';
import 'package:recogenie_task/domain/use_cases/add_to_card_usecase.dart';
import 'package:recogenie_task/domain/use_cases/get_cart_items_usecase.dart';
import 'package:recogenie_task/domain/use_cases/remove_from_cart_usecase.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  @factoryMethod
  CartCubit(this._getCartItemsUsecase, this._addToCardUsecase,
      this._removeFromCartUsecase)
      : super(CartInitial());

  final GetCartItemsUsecase _getCartItemsUsecase;
  final AddToCardUsecase _addToCardUsecase;
  final RemoveFromCartUsecase _removeFromCartUsecase;

  static CartCubit get(context) => BlocProvider.of(context);

  List<ProductModel> cartItemCache = [];
  Future<void> getCartItems() async {
    emit(CartLoading());
    final result = await _getCartItemsUsecase();
    switch (result) {
      case Success():
        cartItemCache = result.data ?? [];
        emit(CartLoaded(products: cartItemCache));
        break;
      case Error():
        emit(CartError(message: result.exception.toString()));
    }
  }

  Future<void> addToCart(ProductModel product) async {
    final result = await _addToCardUsecase(product);
    switch (result) {
      case Success():
        emit(CartItemAdded());
        break;
      case Error():
        emit(CartError(message: result.exception.toString()));
    }
  }

  Future<void> removeFromCart(String productId) async {
    final result = await _removeFromCartUsecase(productId);
    switch (result) {
      case Success():
        cartItemCache.removeWhere((item) => item.id == productId);
        emit(CartLoaded(products: cartItemCache));
        // emit(CartItemRemoved());
        break;
      case Error():
        emit(CartError(message: result.exception.toString()));
    }
  }
}
