import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homecenter/features/products/presentation/bloc/cart/cart_bloc.dart';
import 'package:homecenter/features/products/presentation/widgets/product_cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carrito")),
      body: const CartList(),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.products.isEmpty)
          return const Center(child: Text("No hay productos en el carrito"));

        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            return ProductCartCard(
              product: state.products[index],
              onDelete: () => context.read<CartBloc>().add(
                RemoveProductFromCartEvent(product: state.products[index]),
              ),
            );
          },
        );
      },
    );
  }
}
