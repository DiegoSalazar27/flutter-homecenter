part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddProductToCartEvent extends CartEvent {
  final Product product;

  AddProductToCartEvent({required this.product});
}

class RemoveProductFromCartEvent extends CartEvent {
  final Product product;

  RemoveProductFromCartEvent({required this.product});
}

class GetCartEvent extends CartEvent {}
