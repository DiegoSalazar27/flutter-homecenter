import 'package:flutter_test/flutter_test.dart';
import 'package:homecenter/features/products/data/datasources/local/cart_local_datasource.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:mocktail/mocktail.dart';

class MockProduct extends Mock implements Product {}

void main() {
  late CartLocalDatabase cartLocalDatabase;

  setUp(() async {
    cartLocalDatabase = await CartLocalDatabase.memory();
  });

  tearDown(() async {
    await cartLocalDatabase.close();
  });

  group('CartLocalDatabase', () {
    test('should add a product to the cart', () async {
      final product = MockProduct();
      when(() => product.productId).thenReturn('123');
      when(() => product.displayName).thenReturn('Product 1');
      when(
        () => product.mediaUrls,
      ).thenReturn(['https://example.com/product1.jpg']);
      when(() => product.price).thenReturn('10.99');

      await cartLocalDatabase.addToCart(product);

      final result = await cartLocalDatabase.getAllCartItems();
      expect(result.length, 1);
      expect(result[0].productId, '123');
      expect(result[0].displayName, 'Product 1');
      expect(result[0].mediaUrls, ['https://example.com/product1.jpg']);
      expect(result[0].price, '10.99');
    });

    test('should remove a product from the cart', () async {
      final product = MockProduct();
      when(() => product.productId).thenReturn('123');
      when(() => product.displayName).thenReturn('Product 1');
      when(
        () => product.mediaUrls,
      ).thenReturn(['https://example.com/product1.jpg']);
      when(() => product.price).thenReturn('10.99');

      await cartLocalDatabase.addToCart(product);

      await cartLocalDatabase.removeFromCart('123');

      final result = await cartLocalDatabase.getAllCartItems();
      expect(result.length, 0);
    });

    test('should clear all cart items', () async {
      final product1 = MockProduct();
      when(() => product1.productId).thenReturn('123');
      when(() => product1.displayName).thenReturn('Product 1');
      when(
        () => product1.mediaUrls,
      ).thenReturn(['https://example.com/product1.jpg']);
      when(() => product1.price).thenReturn('10.99');

      final product2 = MockProduct();
      when(() => product2.productId).thenReturn('456');
      when(() => product2.displayName).thenReturn('Product 2');
      when(
        () => product2.mediaUrls,
      ).thenReturn(['https://example.com/product2.jpg']);
      when(() => product2.price).thenReturn('20.99');

      await cartLocalDatabase.addToCart(product1);
      await cartLocalDatabase.addToCart(product2);

      await cartLocalDatabase.clearCart();

      final result = await cartLocalDatabase.getAllCartItems();
      expect(result.length, 0);
    });
  });
}
