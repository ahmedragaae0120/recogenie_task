import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/data/model/product_model.dart';
import 'package:recogenie_task/domain/use_cases/get_products_usecase.dart';

part 'menu_state.dart';

@injectable
class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this._getPorductsUsecase) : super(MenuInitial());
  final GetPorductsUsecase _getPorductsUsecase;

  getProducts() async {
    emit(MenuLoading());
    final result = await _getPorductsUsecase();
    switch (result) {
      case Success():
        emit(MenuLoaded(result.data));
        break;
      case Error():
        emit(MenuError(result.exception.toString()));
        break;
    }
  }
}
