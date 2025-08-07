import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../../models/product_db_dto.dart';

part 'cart_local_datasource.g.dart';

/// Main application database using Drift
@DriftDatabase(tables: [ProductCartItem])
class CartLocalDatabase extends _$CartLocalDatabase {
  CartLocalDatabase() : super(_openConnection());

  /// For testing with in-memory database
  CartLocalDatabase.memory() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;

  /// Get all cart items
  Future<List<Product>> getAllCartItems() async {
    try {
      final query = select(productCartItem);

      final results = await query.get();

      return results
          .map(
            (data) => Product(
              productId: data.productId,
              mediaUrls: data.mediaUrls,
              price: data.price,
              displayName: data.displayName,
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Add item to cart
  Future<void> addToCart(Product item) async {
    try {
      await into(productCartItem).insert(
        ProductCartItemCompanion.insert(
          productId: item.productId,
          displayName: item.displayName,
          mediaUrls: item.mediaUrls,
          price: item.price,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Remove item from cart
  Future<void> removeFromCart(String id) async {
    try {
      await (delete(
        productCartItem,
      )..where((t) => t.productId.equals(id))).go();
    } catch (e) {
      rethrow;
    }
  }

  /// Clear all cart items
  Future<void> clearCart() async {
    try {
      await (delete(productCartItem)).go();
    } catch (e) {
      rethrow;
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'cart.db'));

    // Make sure sqlite3 is available for Flutter apps
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    return NativeDatabase(file);
  });
}
