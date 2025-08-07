import 'package:homecenter/features/products/data/datasources/local/cart_local_datasource.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';

import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  const CartRepositoryImpl({required CartLocalDatabase cartLocalDatabase})
    : _cartLocalDatabase = cartLocalDatabase;

  final CartLocalDatabase _cartLocalDatabase;

  @override
  /// Add item to cart
  /// [item] is the product to add to the cart
  Future<void> addToCart(Product item) {
    return _cartLocalDatabase.addToCart(item);
  }

  @override
  /// Get all cart items
  /// Returns a [Future] that resolves with a [List] of [Product]s, which are the items in the cart
  Future<List<Product>> getCartProducts() {
    return _cartLocalDatabase.getAllCartItems();
  }

  @override
  /// Remove item from cart
  /// [id] is the id of the product to remove from cart
  /// Returns a [Future] that resolves when the item is removed from cart
  Future<void> removeFromCart(Product product) {
    return _cartLocalDatabase.removeFromCart(product.productId);
  }
}
