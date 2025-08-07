import 'package:flutter_test/flutter_test.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';

void main() {
  group('Product', () {
    test(
      'should create a Product with id, mediaUrls, price and displayName',
      () {
        final product = Product(
          productId: '1',
          mediaUrls: ['url1', 'url2'],
          price: '10.99',
          displayName: 'Product 1',
        );

        expect(product.productId, '1');
        expect(product.mediaUrls, ['url1', 'url2']);
        expect(product.price, '10.99');
        expect(product.displayName, 'Product 1');
      },
    );

    test('should override equality', () {
      final product1 = Product(
        productId: '1',
        mediaUrls: ['url1', 'url2'],
        price: '10.99',
        displayName: 'Product 1',
      );
      final product2 = Product(
        productId: '1',
        mediaUrls: ['url1', 'url2'],
        price: '10.99',
        displayName: 'Product 1',
      );
      final product3 = Product(
        productId: '2',
        mediaUrls: ['url3', 'url4'],
        price: '20.99',
        displayName: 'Product 2',
      );

      expect(product1 == product2, true);
      expect(product1 == product3, false);
    });

    test('should override hashCode', () {
      final product1 = Product(
        productId: '1',
        mediaUrls: ['url1', 'url2'],
        price: '10.99',
        displayName: 'Product 1',
      );
      final product2 = Product(
        productId: '1',
        mediaUrls: ['url1', 'url2'],
        price: '10.99',
        displayName: 'Product 1',
      );
      final product3 = Product(
        productId: '2',
        mediaUrls: ['url3', 'url4'],
        price: '20.99',
        displayName: 'Product 2',
      );

      expect(product1.hashCode == product2.hashCode, true);
      expect(product1.hashCode == product3.hashCode, false);
    });
  });
}
