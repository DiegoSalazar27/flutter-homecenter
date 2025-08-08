import 'package:dio/dio.dart';
import 'package:homecenter/core/utils/http_exceptions_handler.dart';
import 'package:homecenter/features/products/data/datasources/remote/dio_datasource.dart';
import 'package:homecenter/features/products/data/models/product_dto.dart';

class ProductsRemoteDatasource extends DioDatasource {
  ProductsRemoteDatasource({required super.dio, required super.baseUrl});

  Future<List<ProductDto>> getProducts({
    required String page,
    String q = '',
  }) async {
    try {
      final response = await this.dio.get<Map<String, dynamic>>(
        '/soco/',
        queryParameters: {
          "currentpage": page,
          "q": q,
          "priceGroup": "10",
        },
        options: buildCacheOptions(
          const Duration(hours: 24),
        ),
      );

      if (response.data == null) {
        throw const HTTPException('No data received');
      }

      if (response.data!["data"]["results"] == null) {
        throw const HTTPException('No data received');
      }

      var results = (response.data!["data"]["results"] as List<dynamic>).map(
        (product) {
          return ProductDto.fromJson(product as Map<String, dynamic>);
        },
      ).toList();

      // Resulto ser porque el punto lo tomaba como un punto flotante, tomando solo 2 decimales,
      // Al quitar el punto del string ya se soluciono el problema
      results.sort((a, b) {
        final priceA = int.parse(a.price.replaceAll("\.", ""));
        final priceB = int.parse(b.price.replaceAll("\.", ""));

        return priceA.compareTo(priceB);
      });

      return results;
    } on DioException catch (e) {
      throw HTTPException.fromDioException(e);
    } catch (e) {
      throw HTTPException('Unexpected error: $e');
    }
  }
}
