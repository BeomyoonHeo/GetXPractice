import 'package:dio/dio.dart';

class LogIntercepter extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //logger.d("데이터 확인 : ${response.data}");
    super.onResponse(response, handler);
  }
}
