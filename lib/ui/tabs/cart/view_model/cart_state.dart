part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  CartLoaded({required this.products});
  final List<ProductModel> products;
}

class CartError extends CartState {
  CartError({required this.message});
  final String message;
}

class CartItemAdded extends CartState {}

class CartItemRemoved extends CartState {}
