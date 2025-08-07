import '../entities/product.dart';

abstract class CartRepository {
  Future<List<Product>> getCartProducts();

  Future<void> addToCart(Product item);

  Future<void> removeFromCart(Product product);
}
