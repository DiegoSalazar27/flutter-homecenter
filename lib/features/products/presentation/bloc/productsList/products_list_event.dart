part of 'products_list_bloc.dart';

abstract class ProductsListEvent extends Equatable {
  const ProductsListEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductsListEvent {
  final int? page;
  final String? q;

  const LoadProducts({required this.page, this.q});
}

class AddProductToCart extends ProductsListEvent {
  final Product product;
  const AddProductToCart(this.product);
}

class ProductListLoadMoreProducts extends ProductsListEvent {}
