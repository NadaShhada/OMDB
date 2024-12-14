import 'package:dio/dio.dart';

class HttpConnection {
  static HttpConnection? _instance;
  final Dio _dio;

  HttpConnection._(this._dio);

  factory HttpConnection.getInstance(String baseUrl) {
    Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _instance ??= HttpConnection._(_dio);
    return _instance!;
  }

  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
        options: options,

        );
  }
}
