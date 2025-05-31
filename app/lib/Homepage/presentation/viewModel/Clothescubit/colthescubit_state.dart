part of 'colthescubit_cubit.dart';

@immutable
sealed class ColthescubitState {}

final class ColthescubitInitial extends ColthescubitState {}

final class ColthescubitLoading extends ColthescubitState {}


final class ColthescubitFaliure extends ColthescubitState {
  final String errorMessage;
  ColthescubitFaliure(this.errorMessage);
}


final class ColthescubitSuccess extends ColthescubitState {
  final List<Product> products;
  ColthescubitSuccess({required this.products});

}


class ColthescubitProductSelected extends ColthescubitState {
  final int? selectedProductId;
  ColthescubitProductSelected(this.selectedProductId);
}
