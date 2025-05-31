import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/Homepage/data/Repo/home_repo.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart';
import 'package:shopp/core/error/Failure.dart';

part 'colthescubit_state.dart';

class ColthescubitCubit extends Cubit<ColthescubitState> {
  final HomeRepo homeRepo;
  List<Product> _currentProducts = [];
  int? selectedProductId;

  ColthescubitCubit(this.homeRepo) : super(ColthescubitInitial());

  Future<void> fetchCategoryProducts(TabItem tab) async {
    try {
      emit(ColthescubitLoading());

      Either<Failure, List<Product>> result;

      switch (tab) {
        case TabItem.beauty:
          result = await homeRepo.fetchproductbeauty();
          break;
        case TabItem.fragrances:
          result = await homeRepo.fetchproductfragrances();
          break;
        case TabItem.furniture:
          result = await homeRepo.fetchproductfurniture();
          break;
        case TabItem.groceries:
          result = await homeRepo.fetchproductgroceries();
          break;
      }

      result.fold(
        (failure) => emit(ColthescubitFaliure(failure.errMessage)),
        (products) {
          _currentProducts = products;
          emit(ColthescubitSuccess(products: products));
        },
      );
    } catch (e) {
      emit(ColthescubitFaliure(e.toString()));
    }
  }

  Product? getProductById(int id) {
    try {
      return _currentProducts.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  void setSelectedProductId(int productId) {
    selectedProductId = productId;
    // Only emit a new state if you want to specifically track selection changes
    // Otherwise, just update the field without emitting
    // emit(ColthescubitProductSelected(selectedProductId));
  }

  void clearSelectedProductId() {
    selectedProductId = null;
    // Only emit if you have specific selection state handling
    // emit(ColthescubitProductSelected(null));
  }

  Future<void> refreshCurrentCategory(TabItem currentTab) async {
    await fetchCategoryProducts(currentTab);
  }
}