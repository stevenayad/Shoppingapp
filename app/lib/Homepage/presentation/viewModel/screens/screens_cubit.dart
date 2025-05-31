import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screens_state.dart';

enum TabItem { beauty, fragrances, furniture, groceries }

class ScreensCubit extends Cubit<TabItem> {
  ScreensCubit() : super(TabItem.beauty);

  void seletedtab(TabItem tab) {
    emit(tab);
  }
}
