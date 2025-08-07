part of 'products_list_bloc.dart';

abstract class ProductsListState extends Equatable {
  const ProductsListState({
    required this.products,
    this.page = 1,
    this.query = '',
  });

  final List<Product> products;
  final int page;
  final String query;

  @override
  List<Object> get props => [products, page, query];
}

class ProductsListInitial extends ProductsListState {
  ProductsListInitial() : super(products: [], page: 1, query: '');
}

class ProductsListLoading extends ProductsListState {
  ProductsListLoading(List<Product> products, int page, String query)
    : super(products: products, page: 1, query: query);

  ProductsListLoading copyWith({
    List<Product>? products,
    int? page,
    String? query,
  }) {
    return ProductsListLoading(
      products ?? this.products,
      page ?? this.page,
      query ?? this.query,
    );
  }
}

class ProductsListLoaded extends ProductsListState {
  ProductsListLoaded(List<Product> products, int page, String query)
    : super(products: products, page: page, query: query);

  ProductsListLoaded copyWith({
    List<Product>? products,
    int? page,
    String? query,
  }) {
    return ProductsListLoaded(
      products ?? this.products,
      page ?? this.page,
      query ?? this.query,
    );
  }
}

class ProductsListError extends ProductsListState {
  ProductsListError(
    List<Product> products,
    int page,
    String query,
    this.message,
  ) : super(products: products, page: page, query: query);

  final String message;
  ProductsListError copyWith({
    List<Product>? products,
    int? page,
    String? query,
    String? message,
  }) {
    return ProductsListError(
      products ?? this.products,
      page ?? this.page,
      query ?? this.query,
      message ?? this.message,
    );
  }
}
