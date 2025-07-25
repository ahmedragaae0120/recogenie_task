part of 'menu_cubit.dart';

abstract class MenuState {}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  MenuLoaded(this.products);
  final List<ProductModel>? products;
}

class MenuError extends MenuState {
  MenuError(this.message);
  final String message;
}
