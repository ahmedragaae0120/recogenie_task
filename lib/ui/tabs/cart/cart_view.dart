import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recogenie_task/ui/tabs/cart/view_model/cart_cubit.dart';
import 'package:recogenie_task/ui/tabs/cart/widgets/cart_item_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: theme.primaryColor,
            ),
          );
        }
        if (state is CartLoaded) {
          if (state.products.isEmpty) {
            return Center(
              child: Text(
                'Your cart is empty',
                style: theme.textTheme.headlineLarge,
              ),
            );
          }
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return CartItemWidget(
                name: state.products[index].name ?? '',
                imageUrl: state.products[index].imageUrl ?? '',
                quantity: 1,
                onRemove: () {
                  CartCubit.get(context)
                      .removeFromCart(state.products[index].id ?? '');
                },
              );
            },
          );
        } else if (state is CartError) {
          return Center(child: Text(state.message));
        }
        return Center(
          child: Text(
            'No items in cart',
            style: theme.textTheme.headlineLarge,
          ),
        );
      },
    );
  }
}
