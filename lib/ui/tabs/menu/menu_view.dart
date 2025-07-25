import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recogenie_task/data/model/product_model.dart';
import 'package:recogenie_task/ui/tabs/menu/view_model/menu_cubit.dart';
import 'package:recogenie_task/ui/tabs/menu/widgets/product_item_widget.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        if (state is MenuLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: theme.primaryColor,
          ));
        } else if (state is MenuLoaded) {
          print("Successfully💚💚 loaded products: ${state.products?.length}");
          return ListView.builder(
            itemCount: state.products?.length ?? 0,
            itemBuilder: (context, index) {
              return ProductItemWidget(
                  productModel: state.products?[index] ?? ProductModel());
            },
          );
        } else if (state is MenuError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('No products available'));
      },
    );
  }
}
