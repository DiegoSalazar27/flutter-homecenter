import 'package:homecenter/features/products/domain/repositories/products_repository.dart';
import '../entities/product.dart';

class GetProducts {
  const GetProducts({
    required ProductsRepository repository,
  }) : _repository = repository;

  final ProductsRepository _repository;

  Future<List<Product>> call({required String query, required int page}) {
    return _repository.getProducts(q: query, page: page);
  }
}
