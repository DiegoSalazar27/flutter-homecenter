import 'package:homecenter/features/products/domain/repositories/cart_repository.dart';
import '../entities/product.dart';

class GetCartProducts {
  const GetCartProducts({
    required CartRepository repository,
  }) : _repository = repository;

  final CartRepository _repository;

  Future<List<Product>> call() {
    return _repository.getCartProducts();
  }
}
