import 'package:flutter_test/flutter_test.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:homecenter/features/products/domain/repositories/cart_repository.dart';
import 'package:homecenter/features/products/domain/usecases/get_products_cart.dart';
import 'package:mocktail/mocktail.dart';

class MockCartRepository extends Mock implements CartRepository {}

void main() {
  late MockCartRepository mockCartRepository;
  late GetCartProducts getCart;

  setUp(() {
    mockCartRepository = MockCartRepository();
    getCart = GetCartProducts(repository: mockCartRepository);
  });

  group('GetCart', () {
    test('should return a list of products when getCart is called', () async {
      final products = [
        Product(
          productId: '123',
          displayName: 'Product 1',
          mediaUrls: ['https://example.com/product1.jpg'],
          price: '10.99',
        ),
      ];

      when(
        () => mockCartRepository.getCartProducts(),
      ).thenAnswer((_) async => products);

      final result = await getCart();

      expect(result, products);
    });

    test('should throw an exception when getCart fails', () async {
      when(() => mockCartRepository.getCartProducts()).thenThrow(Exception());

      expect(() async => await getCart(), throwsException);
    });
  });
}
