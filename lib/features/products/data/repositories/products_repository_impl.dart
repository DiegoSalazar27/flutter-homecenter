import 'package:homecenter/features/products/data/datasources/remote/products_remote_datasource.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:homecenter/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl(this.remoteDatasource);

  final ProductsRemoteDatasource remoteDatasource;

  @override
  Future<List<Product>> getProducts({required int page, required String q}) {
    return remoteDatasource.getProducts(page: page.toString(), q: q);
  }
}
