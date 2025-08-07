import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductCartCard extends StatelessWidget {
  final Product product;
  final Function onDelete;

  ProductCartCard({required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              product.mediaUrls.first,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.displayName,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    product.price,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                onDelete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
