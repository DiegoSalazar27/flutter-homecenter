import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:homecenter/features/products/presentation/bloc/cart/cart_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 245,
      height: 380,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              product.mediaUrls[0],
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.displayName,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(product.price, style: theme.textTheme.bodyMedium),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(
                        AddProductToCartEvent(product: product),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Producto añadido al carrito'),
                        ),
                      );
                    },
                    child: const Text('Añadir al carrito'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
