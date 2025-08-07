import 'package:equatable/equatable.dart';

/// Homecenter Product
class Product extends Equatable {
  /// Constructor
  const Product({
    required this.productId,
    required this.mediaUrls,
    required this.price,
    required this.displayName,
  });

  /// Product id
  final String productId;

  /// Product media urls
  final List<String> mediaUrls;

  /// Product NORMAL price
  final String price;

  /// Product display name
  final String displayName;

  @override
  List<Object?> get props => [
    productId,
    mediaUrls,
    price,
    displayName,
  ];
}
