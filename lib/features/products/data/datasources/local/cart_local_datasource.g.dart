// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_local_datasource.dart';

// ignore_for_file: type=lint
class $ProductCartItemTable extends ProductCartItem
    with TableInfo<$ProductCartItemTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductCartItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> mediaUrls =
      GeneratedColumn<String>(
        'media_urls',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 255,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($ProductCartItemTable.$convertermediaUrls);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
    'price',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productId,
    mediaUrls,
    price,
    displayName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_cart_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      mediaUrls: $ProductCartItemTable.$convertermediaUrls.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}media_urls'],
        )!,
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
    );
  }

  @override
  $ProductCartItemTable createAlias(String alias) {
    return $ProductCartItemTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertermediaUrls =
      JsonConverter();
}

class ProductCartItemCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> productId;
  final Value<List<String>> mediaUrls;
  final Value<String> price;
  final Value<String> displayName;
  const ProductCartItemCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.mediaUrls = const Value.absent(),
    this.price = const Value.absent(),
    this.displayName = const Value.absent(),
  });
  ProductCartItemCompanion.insert({
    this.id = const Value.absent(),
    required String productId,
    required List<String> mediaUrls,
    required String price,
    required String displayName,
  }) : productId = Value(productId),
       mediaUrls = Value(mediaUrls),
       price = Value(price),
       displayName = Value(displayName);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? productId,
    Expression<String>? mediaUrls,
    Expression<String>? price,
    Expression<String>? displayName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (mediaUrls != null) 'media_urls': mediaUrls,
      if (price != null) 'price': price,
      if (displayName != null) 'display_name': displayName,
    });
  }

  ProductCartItemCompanion copyWith({
    Value<int>? id,
    Value<String>? productId,
    Value<List<String>>? mediaUrls,
    Value<String>? price,
    Value<String>? displayName,
  }) {
    return ProductCartItemCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      mediaUrls: mediaUrls ?? this.mediaUrls,
      price: price ?? this.price,
      displayName: displayName ?? this.displayName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (mediaUrls.present) {
      map['media_urls'] = Variable<String>(
        $ProductCartItemTable.$convertermediaUrls.toSql(mediaUrls.value),
      );
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCartItemCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('mediaUrls: $mediaUrls, ')
          ..write('price: $price, ')
          ..write('displayName: $displayName')
          ..write(')'))
        .toString();
  }
}

abstract class _$CartLocalDatabase extends GeneratedDatabase {
  _$CartLocalDatabase(QueryExecutor e) : super(e);
  $CartLocalDatabaseManager get managers => $CartLocalDatabaseManager(this);
  late final $ProductCartItemTable productCartItem = $ProductCartItemTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productCartItem];
}

typedef $$ProductCartItemTableCreateCompanionBuilder =
    ProductCartItemCompanion Function({
      Value<int> id,
      required String productId,
      required List<String> mediaUrls,
      required String price,
      required String displayName,
    });
typedef $$ProductCartItemTableUpdateCompanionBuilder =
    ProductCartItemCompanion Function({
      Value<int> id,
      Value<String> productId,
      Value<List<String>> mediaUrls,
      Value<String> price,
      Value<String> displayName,
    });

class $$ProductCartItemTableFilterComposer
    extends Composer<_$CartLocalDatabase, $ProductCartItemTable> {
  $$ProductCartItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get mediaUrls => $composableBuilder(
    column: $table.mediaUrls,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductCartItemTableOrderingComposer
    extends Composer<_$CartLocalDatabase, $ProductCartItemTable> {
  $$ProductCartItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaUrls => $composableBuilder(
    column: $table.mediaUrls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductCartItemTableAnnotationComposer
    extends Composer<_$CartLocalDatabase, $ProductCartItemTable> {
  $$ProductCartItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get mediaUrls =>
      $composableBuilder(column: $table.mediaUrls, builder: (column) => column);

  GeneratedColumn<String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );
}

class $$ProductCartItemTableTableManager
    extends
        RootTableManager<
          _$CartLocalDatabase,
          $ProductCartItemTable,
          Product,
          $$ProductCartItemTableFilterComposer,
          $$ProductCartItemTableOrderingComposer,
          $$ProductCartItemTableAnnotationComposer,
          $$ProductCartItemTableCreateCompanionBuilder,
          $$ProductCartItemTableUpdateCompanionBuilder,
          (
            Product,
            BaseReferences<_$CartLocalDatabase, $ProductCartItemTable, Product>,
          ),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductCartItemTableTableManager(
    _$CartLocalDatabase db,
    $ProductCartItemTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductCartItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductCartItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductCartItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<List<String>> mediaUrls = const Value.absent(),
                Value<String> price = const Value.absent(),
                Value<String> displayName = const Value.absent(),
              }) => ProductCartItemCompanion(
                id: id,
                productId: productId,
                mediaUrls: mediaUrls,
                price: price,
                displayName: displayName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String productId,
                required List<String> mediaUrls,
                required String price,
                required String displayName,
              }) => ProductCartItemCompanion.insert(
                id: id,
                productId: productId,
                mediaUrls: mediaUrls,
                price: price,
                displayName: displayName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductCartItemTableProcessedTableManager =
    ProcessedTableManager<
      _$CartLocalDatabase,
      $ProductCartItemTable,
      Product,
      $$ProductCartItemTableFilterComposer,
      $$ProductCartItemTableOrderingComposer,
      $$ProductCartItemTableAnnotationComposer,
      $$ProductCartItemTableCreateCompanionBuilder,
      $$ProductCartItemTableUpdateCompanionBuilder,
      (
        Product,
        BaseReferences<_$CartLocalDatabase, $ProductCartItemTable, Product>,
      ),
      Product,
      PrefetchHooks Function()
    >;

class $CartLocalDatabaseManager {
  final _$CartLocalDatabase _db;
  $CartLocalDatabaseManager(this._db);
  $$ProductCartItemTableTableManager get productCartItem =>
      $$ProductCartItemTableTableManager(_db, _db.productCartItem);
}
