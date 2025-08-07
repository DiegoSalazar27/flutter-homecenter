import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:homecenter/features/products/domain/usecases/add_product_cart.dart';
import 'package:homecenter/features/products/domain/usecases/get_products_cart.dart';
import 'package:homecenter/features/products/domain/usecases/remove_product_cart.dart';
import 'package:homecenter/features/products/presentation/bloc/cart/cart_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockAddProductToCart extends Mock implements AddProductToCart {}

class MockGetCart extends Mock implements GetCartProducts {}

class MockRemoveProductFromCart extends Mock implements RemoveProductFromCart {}

void main() {
  late MockAddProductToCart mockAddProductToCart;
  late MockGetCart mockGetCart;
  late MockRemoveProductFromCart mockRemoveProductFromCart;
  late CartBloc cartBloc;

  setUp(() {
    mockAddProductToCart = MockAddProductToCart();
    mockRemoveProductFromCart = MockRemoveProductFromCart();
    mockGetCart = MockGetCart();
    cartBloc = CartBloc(
      addProductToCart: mockAddProductToCart,
      getCart: mockGetCart,
      removeProductFromCart: mockRemoveProductFromCart,
    );

    when(() => mockGetCart()).thenAnswer(
      (_) async => [
        Product(
          productId: '123',
          displayName: 'Product 1',
          mediaUrls: ['https://example.com/product1.jpg'],
          price: '10.99',
        ),
        Product(
          productId: '456',
          displayName: 'Product 2',
          mediaUrls: ['https://example.com/product2.jpg'],
          price: '19.99',
        ),
      ],
    );

    when(
      () => mockAddProductToCart(
        product: Product(
          productId: "1234",
          displayName: "Product 3",
          mediaUrls: ["https://example.com/product1.jpg"],
          price: "10.99",
        ),
      ),
    ).thenAnswer((_) async => null);
    when(
      () => mockRemoveProductFromCart(
        product: Product(
          productId: "1234",
          displayName: "Product 3",
          mediaUrls: ["https://example.com/product1.jpg"],
          price: "10.99",
        ),
      ),
    ).thenAnswer((_) async => null);
  });

  group('CartBloc', () {
    blocTest<CartBloc, CartState>(
      'emits CartState.success() when AddProductToCartEvent is added',
      build: () => cartBloc,
      act: (bloc) {
        bloc.add(
          AddProductToCartEvent(
            product: Product(
              productId: '1234',
              displayName: 'Product 3',
              mediaUrls: ['https://example.com/product1.jpg'],
              price: '10.99',
            ),
          ),
        );
      },
      verify: (_) {
        verify(
          () => mockAddProductToCart(
            product: Product(
              productId: '1234',
              displayName: 'Product 3',
              mediaUrls: ['https://example.com/product1.jpg'],
              price: '10.99',
            ),
          ),
        ).called(1);
        verify(() => mockGetCart()).called(1);
      },
    );

    blocTest<CartBloc, CartState>(
      'emits CartState.success() when GetCartEvent is added',
      build: () => cartBloc,
      act: (bloc) {
        bloc.add(GetCartEvent());
      },
      verify: (_) {
        verify(() => mockGetCart());
      },
    );

    blocTest<CartBloc, CartState>(
      'emits CartState.success() when RemoveProductFromCartEvent is added',
      build: () => cartBloc,
      act: (bloc) {
        bloc.add(
          RemoveProductFromCartEvent(
            product: Product(
              productId: '1234',
              displayName: 'Product 3',
              mediaUrls: ['https://example.com/product1.jpg'],
              price: '10.99',
            ),
          ),
        );
      },
      verify: (_) {
        verify(
          () => mockRemoveProductFromCart(
            product: Product(
              productId: '1234',
              displayName: 'Product 3',
              mediaUrls: ['https://example.com/product1.jpg'],
              price: '10.99',
            ),
          ),
        ).called(1);
        verify(() => mockGetCart()).called(1);
      },
    );
  });
}
