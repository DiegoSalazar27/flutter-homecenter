import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homecenter/core/dependency_injection/injection_container.dart';
import 'package:homecenter/features/products/presentation/bloc/cart/cart_bloc.dart';
import 'package:homecenter/features/products/presentation/bloc/productsList/products_list_bloc.dart';
import 'package:homecenter/features/products/presentation/widgets/cart_button.dart';
import 'package:homecenter/features/products/presentation/widgets/product_list.dart';

import '../widgets/product_search.dart';

/// Products page
class ProductsPage extends StatefulWidget {
  /// Constructor
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductsListBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CartBloc>()..add(GetCartEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Productos"),
          actions: [
            SearchButton(),
          ],
        ),
        floatingActionButton: CartButton(),
        body: BlocBuilder<ProductsListBloc, ProductsListState>(
          builder: (context, state) {
            return switch (state) {
              ProductsListInitial() => const Center(
                child: Center(
                  child: Text("Presiona el botón de busqueda para comenzar"),
                ),
              ),
              ProductsListError() => Center(
                child: Text("Error ${state.message}"),
              ),
              ProductsListState() =>
                state.query.isEmpty || state.products.isEmpty
                    ? const Center(child: Text("No hay productos"))
                    : ProductList(products: state.products),
            };
          },
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () async {
        final String? result = await showSearch(
          context: context,
          delegate: CustomSearchDelegate(
            context.read<ProductsListBloc>().state.query,
          ),
        );
        // Update the state with the selected result, if any
        if (result != null && result.isNotEmpty) {
          if (result == context.read<ProductsListBloc>().state.query) return;

          context.read<ProductsListBloc>().add(
            LoadProducts(page: 1, q: result),
          );
        }
      },
    );
  }
}
