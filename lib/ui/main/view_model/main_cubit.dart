import 'package:bloc/bloc.dart';
import 'package:recogenie_task/core/utils/app_strings.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(0); // default tab index is 0

  void changeTab(int index) => emit(index);

  String get currentTitle {
    switch (state) {
      case 0:
        return AppStrings.menu;
      case 1:
        return AppStrings.cart;
      default:
        return '';
    }
  }
}
