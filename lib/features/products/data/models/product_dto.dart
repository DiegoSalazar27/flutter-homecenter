import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

/// Data Transfer Object for Country from REST Countries API
@JsonSerializable()
class ProductDto extends Product {
  const ProductDto({
    required super.displayName,
    required super.mediaUrls,
    required String price,
    required super.productId,
  }) : price = price,
       super(price: price);

  @JsonKey(fromJson: _priceFromJson, name: "prices")
  final String price;

  // Filter the Normal price
  /// Get price from json
  static String _priceFromJson(List<dynamic>? value) =>
      value?.where((v) => v['type'] == 'NORMAL').first['price'] as String? ??
      "";

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  /// Convert DTO to domain entity
  Product toEntity() {
    return Product(
      displayName: displayName,
      mediaUrls: mediaUrls,
      price: price,
      productId: productId,
    );
  }
}
