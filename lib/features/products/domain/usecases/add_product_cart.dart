import 'package:homecenter/features/products/domain/repositories/cart_repository.dart';
import '../entities/product.dart';

class AddProductToCart {
  const AddProductToCart({
    required CartRepository repository,
  }) : _repository = repository;

  final CartRepository _repository;

  /// Adds a product to the cart.
  ///
  /// Takes a [Product] object as a required parameter and delegates
  /// the addition of the product to the cart repository.
  Future<void> call({required Product product}) {
    return _repository.addToCart(product);
  }
}
