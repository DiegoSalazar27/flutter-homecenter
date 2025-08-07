import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:homecenter/features/products/domain/repositories/cart_repository.dart';

class RemoveProductFromCart {
  const RemoveProductFromCart({
    required CartRepository repository,
  }) : _repository = repository;

  final CartRepository _repository;

  Future<void> call({required Product product}) {
    return _repository.removeFromCart(product);
  }
}
