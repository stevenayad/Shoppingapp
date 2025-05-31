part of 'item_cubit.dart';

@immutable
abstract class ItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ItemInitial extends ItemState {}

class ItemSuccess extends ItemState {
  final List<Product> products;
  ItemSuccess(this.products);

  @override
  List<Object?> get props => [products];
}
