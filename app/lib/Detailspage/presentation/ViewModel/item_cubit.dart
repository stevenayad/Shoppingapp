import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());

  final List<Product> cartItems = [];

  double _totalPrice = 0.0;

  void add(Product product) {
    cartItems.add(product);
    _totalPrice += product.price ?? 0.0;
    emit(ItemSuccess(List.from(cartItems)));
  }

  void remove(Product product) {
    cartItems.remove(product);
    _totalPrice -= product.price ?? 0.0;
    emit(ItemSuccess(List.from(cartItems)));
  }

  bool contains(Product product) => cartItems.contains(product);

  int get count => cartItems.length;

  double get totalPrice => _totalPrice;

  List<Product> get product => cartItems;
}
