import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:homecenter/features/products/domain/usecases/get_products.dart';
import 'package:homecenter/features/products/presentation/bloc/productsList/products_list_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProducts extends Mock implements GetProducts {}

void main() {
  late ProductsListBloc productsListBloc;
  late MockGetProducts mockGetProducts;

  setUp(() {
    mockGetProducts = MockGetProducts();
    productsListBloc = ProductsListBloc(mockGetProducts);

    when(() => mockGetProducts(page: 1, query: "taladros")).thenAnswer(
      (_) async => [
        Product(
          productId: '1',
          mediaUrls: ['url1'],
          price: '10.99',
          displayName: 'Product 1',
        ),
        Product(
          productId: '2',
          mediaUrls: ['url2'],
          price: '20.99',
          displayName: 'Product 2',
        ),
      ],
    );

    when(() => mockGetProducts(page: 1, query: "")).thenAnswer((_) async => []);
  });

  tearDown(() {
    productsListBloc.close();
  });

  test('initial state is ProductsListInitial', () {
    expect(productsListBloc.state, ProductsListInitial());
  });

  blocTest(
    'LoadProductsEvent with no products',
    build: () => productsListBloc,
    act: (bloc) => bloc.add(const LoadProducts(page: 1, q: "")),
    expect: () => [
      ProductsListLoading([], 1, ""),
      ProductsListLoaded([], 1, ""),
    ],
  );

  blocTest(
    'LoadProductsEvent with products',
    build: () => productsListBloc,
    act: (bloc) => bloc.add(const LoadProducts(page: 1, q: "taladros")),
    expect: () => [
      ProductsListLoading([], 1, "taladros"),
      ProductsListLoaded(
        [
          Product(
            productId: '1',
            mediaUrls: ['url1'],
            price: '10.99',
            displayName: 'Product 1',
          ),
          Product(
            productId: '2',
            mediaUrls: ['url2'],
            price: '20.99',
            displayName: 'Product 2',
          ),
        ],
        1,
        "taladros",
      ),
    ],
    verify: (bloc) {
      when(() => mockGetProducts.call(page: 1, query: "taladros")).thenAnswer(
        (_) async => [
          Product(
            productId: '1',
            mediaUrls: ['url1'],
            price: '10.99',
            displayName: 'Product 1',
          ),
          Product(
            productId: '2',
            mediaUrls: ['url2'],
            price: '20.99',
            displayName: 'Product 2',
          ),
        ],
      );
    },
  );
}
