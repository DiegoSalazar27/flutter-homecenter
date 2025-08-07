// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homecenter/features/products/presentation/bloc/cart/cart_bloc.dart';
import 'package:homecenter/features/products/presentation/pages/cart_page.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext _) => BlocProvider.value(
            value: context.read<CartBloc>(),
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: const CartPage(),
            ),
          ),
        );
      },
      icon: Icon(Icons.shopping_cart),
    );
  }
}
