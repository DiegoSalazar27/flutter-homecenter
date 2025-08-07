import 'package:drift/drift.dart';

import '../../domain/entities/product.dart';

class JsonConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    return [fromDb];
  }

  @override
  String toSql(List<String> value) {
    return value[0];
  }
}

@UseRowClass(Product)
class ProductCartItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productId => text().withLength(min: 1, max: 255)();
  TextColumn get mediaUrls =>
      text().withLength(min: 1, max: 255).map(JsonConverter())();
  TextColumn get price => text().withLength(min: 1, max: 255)();
  TextColumn get displayName => text().withLength(min: 1, max: 255)();
}
