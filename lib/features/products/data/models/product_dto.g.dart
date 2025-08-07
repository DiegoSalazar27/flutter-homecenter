// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
  displayName: json['displayName'] as String,
  mediaUrls: (json['mediaUrls'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  price: ProductDto._priceFromJson(json['prices'] as List?),
  productId: json['productId'] as String,
);

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'mediaUrls': instance.mediaUrls,
      'displayName': instance.displayName,
      'prices': instance.price,
    };
