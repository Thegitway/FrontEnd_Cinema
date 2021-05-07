import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioInterceptors {
  Dio addInterceptors(Dio dio) {
    final interceptorList = <Interceptor>[];
    interceptorList.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) =>
          requestInterceptor(options, handler),
      onError: (DioError dioError, ErrorInterceptorHandler handler) {
        return errorInterceptor(dioError, handler);
      },
    ));
    interceptorList.add(PrettyDioLogger(
        compact: true,
        requestBody: false,
        requestHeader: true,
        responseBody: false,
        responseHeader: true));
    dio..interceptors.clear();
    return dio..interceptors.addAll(interceptorList);
  }

  dynamic errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) {
    handler.next(dioError);
    return dioError;
  }

  dynamic requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final headers = <String, String>{};
    options.headers.addAll(headers);
    handler.next(options);
    return options;
  }
}
