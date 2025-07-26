import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recogenie_task/core/di/di.dart';
import 'package:recogenie_task/core/utils/app_strings.dart';
import 'package:recogenie_task/ui/main/view_model/main_cubit.dart';
import 'package:recogenie_task/ui/tabs/cart/cart_view.dart';
import 'package:recogenie_task/ui/tabs/cart/view_model/cart_cubit.dart';
import 'package:recogenie_task/ui/tabs/menu/menu_view.dart';
import 'package:recogenie_task/ui/tabs/menu/view_model/menu_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<MenuCubit>()..getProducts(),
          ),
          BlocProvider(
            create: (context) => getIt<CartCubit>(),
          ),
        ],
        child: const MenuView(),
      ),
      BlocProvider(
        create: (context) => getIt<CartCubit>()..getCartItems(),
        child: const CartView(),
      ),
    ];
    return BlocProvider(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, int>(
        builder: (context, state) {
          final cubit = context.read<MainCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.currentTitle),
            ),
            body: tabs[state],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_rounded),
                  label: AppStrings.menu,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: AppStrings.cart,
                ),
              ],
              onTap: cubit.changeTab,
            ),
          );
        },
      ),
    );
  }
}
