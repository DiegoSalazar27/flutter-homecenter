import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homecenter/features/products/domain/usecases/get_products_cart.dart';
import 'package:homecenter/features/products/domain/usecases/remove_product_cart.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecases/add_product_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddProductToCart _addProductToCart;
  final GetCartProducts _getCart;
  final RemoveProductFromCart _removeProductFromCart;

  CartBloc({
    required AddProductToCart addProductToCart,
    required GetCartProducts getCart,
    required RemoveProductFromCart removeProductFromCart,
  }) : _addProductToCart = addProductToCart,
       _getCart = getCart,
       _removeProductFromCart = removeProductFromCart,
       super(CartState.initial()) {
    on<AddProductToCartEvent>(_onAddProductToCart);
    on<GetCartEvent>(_onGetCart);
    on<RemoveProductFromCartEvent>(_onRemoveProductFromCart);
  }

  Future<void> _onAddProductToCart(
    AddProductToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _addProductToCart(product: event.product);
    emit(CartState.success(await _getCart()));
  }

  Future<void> _onRemoveProductFromCart(
    RemoveProductFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _removeProductFromCart(product: event.product);
    emit(CartState.success(await _getCart()));
  }

  Future<void> _onGetCart(
    GetCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final products = await _getCart();
    emit(CartState.success(products));
  }
}
