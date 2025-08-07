import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/bottom_loader.dart';
import '../../domain/entities/product.dart';
import '../bloc/productsList/products_list_bloc.dart';
import 'product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      itemCount: widget.products.length + 1,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) => index >= widget.products.length
          ? const BottomLoader()
          : ProductCard(product: widget.products[index]),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom)
      context.read<ProductsListBloc>().add(
        LoadProducts(page: context.read<ProductsListBloc>().state.page + 1),
      );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
