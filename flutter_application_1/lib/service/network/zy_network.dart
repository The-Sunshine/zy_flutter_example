
import 'package:dio/dio.dart';
import 'package:flutter_application_1/service/network/zy_config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.base_url,
    connectTimeout: HttpConfig.connect_time,
  );
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(
      String url, {
        String method = 'get',
        Interceptor? interceptor,
        Map<String, dynamic>? params,
      }) async {
    final options = Options(method: method);
    Interceptor defaultInterceptor =
    InterceptorsWrapper(onRequest: (options, handler) {
      print("onRequest 请求拦截：" + options.headers.toString());
      return handler.next(options);
    }, onResponse: (response, handler) {
      print("onResponse 响应拦截：" + response.toString());
      return handler.next(response);
    }, onError: (DioError error, handler) {
      print("DioError 错误拦截：" + error.toString());
      return handler.next(error);
    });
    List<Interceptor> inters = [defaultInterceptor];
    if (interceptor != null) {
      inters.add(interceptor);
    }
    dio.interceptors.addAll(inters);
    try {
      final response =
      await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (error) {
      return Future.error(error.message);
    }
  }
}