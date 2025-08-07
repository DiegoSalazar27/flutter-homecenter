import 'package:dio/dio.dart';

/// Custom exception for REST Countries API
class HTTPException implements Exception {
  const HTTPException(this.message);

  factory HTTPException.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const HTTPException('Conexión expirada');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 404) {
          return const HTTPException('No encontrado');
        } else if (statusCode == 500) {
          return const HTTPException('Error en el servidor');
        }
        return HTTPException(
          'HTTP $statusCode: ${e.response?.statusMessage ?? 'Unknown error'}',
        );
      case DioExceptionType.cancel:
        return const HTTPException('Petición cancelada');
      case DioExceptionType.connectionError:
        return const HTTPException('Sin conexión a internet');
      case DioExceptionType.badCertificate:
        return const HTTPException('Certificado invalido');
      case DioExceptionType.unknown:
      default:
        return HTTPException('Error desconocido: ${e.message}');
    }
  }

  final String message;

  @override
  String toString() => 'HTTPException: $message';
}
