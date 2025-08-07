import 'package:flutter_test/flutter_test.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:homecenter/features/products/domain/repositories/products_repository.dart';
import 'package:homecenter/features/products/domain/usecases/get_products.dart';
import 'package:mocktail/mocktail.dart';

class MockProductsRepository extends Mock implements ProductsRepository {}

void main() {
  late GetProducts getProducts;
  late MockProductsRepository mockProductsRepository;

  setUp(() {
    mockProductsRepository = MockProductsRepository();
    getProducts = GetProducts(repository: mockProductsRepository);
  });

  test('should get products from repository', () async {
    final products = [
      Product(
        productId: '1',
        mediaUrls: ['url1'],
        price: '10.99',
        displayName: 'Product 1',
      ),
    ];

    when(
      () => mockProductsRepository.getProducts(q: '', page: 1),
    ).thenAnswer((_) async => products);

    final result = await getProducts.call(query: '', page: 1);

    expect(result, products);
    verify(() => mockProductsRepository.getProducts(page: 1, q: '')).called(1);
  });

  test(
    'should throw an exception when repository throws an exception',
    () async {
      when(
        () => mockProductsRepository.getProducts(page: 1, q: ""),
      ).thenThrow(Exception('Error'));

      expect(
        () async => await getProducts.call(query: "", page: 1),
        throwsException,
      );
      verify(
        () => mockProductsRepository.getProducts(page: 1, q: ""),
      ).called(1);
    },
  );
}
