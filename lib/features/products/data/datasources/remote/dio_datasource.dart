import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:http_cache_drift_store/http_cache_drift_store.dart';
import 'package:path_provider/path_provider.dart';

class DioDatasource {
  DioDatasource({required Dio? dio, required String baseUrl})
    : dio = dio ?? createDio(baseUrl) {
    _initializeCache();
  }

  static CacheOptions? _cacheOptions;
  final Dio dio;

  static Dio createDio(String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    );

    // Add logging interceptor for development
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) {
          // Only log in debug mode
          assert(
            () {
              // ignore: avoid_print
              print(object);
              return true;
            }(),
            'Logging is enabled',
          );
        },
      ),
    );

    return dio;
  }

  /// Initialize cache asynchronously
  Future<void> _initializeCache() async {
    if (_cacheOptions != null) return;

    try {
      final cacheDir = await getTemporaryDirectory();
      final cacheStore = DriftCacheStore(
        databasePath: '${cacheDir.path}/http_cache.db',
      );

      _cacheOptions = CacheOptions(
        store: cacheStore,
        hitCacheOnErrorCodes: [500],
        maxStale: const Duration(days: 7),
        priority: CachePriority.high,
      );

      dio.interceptors.add(DioCacheInterceptor(options: _cacheOptions!));
    } catch (e) {
      // Fallback to memory cache if DB cache setup fails
      _cacheOptions = CacheOptions(
        store: MemCacheStore(),
        hitCacheOnErrorCodes: [500],
        maxStale: const Duration(days: 7),
      );

      dio.interceptors.add(DioCacheInterceptor(options: _cacheOptions!));
    }
  }

  /// Build cache options
  Options buildCacheOptions(Duration maxAge) {
    // Ensure cache is initialized before use
    if (_cacheOptions == null) {
      // Use temporary memory cache if not initialized yet
      return CacheOptions(
        store: MemCacheStore(),
        maxStale: maxAge,
        hitCacheOnErrorCodes: [500],
      ).toOptions();
    }

    return CacheOptions(
      store: _cacheOptions!.store,
      maxStale: maxAge,
      hitCacheOnErrorCodes: [500],
      priority: CachePriority.high,
    ).toOptions();
  }

  /// Close the Dio client cache
  Future<void> close() async {
    dio.close();

    // Clean up cache store
    if (_cacheOptions?.store is DriftCacheStore) {
      await (_cacheOptions!.store! as DriftCacheStore).close();
    }
  }
}
