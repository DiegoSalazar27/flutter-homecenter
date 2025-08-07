part of 'cart_bloc.dart';

class CartState {
  final List<Product> products;
  final String? error;

  factory CartState.initial() => CartState(products: [], error: null);

  factory CartState.loading(List<Product> products) =>
      CartState(products: products, error: null);

  factory CartState.success(List<Product> products) =>
      CartState(products: products, error: null);

  factory CartState.failure(List<Product> products, String error) =>
      CartState(products: products, error: error);

  CartState({required this.products, required this.error});
}
