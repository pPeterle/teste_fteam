import 'package:dio/dio.dart';
import 'package:teste_inicial/app/repository/dio/interceptors/cache_interceptor.dart';

import 'constants.dart';
import 'interceptors/base_interceptor.dart';

class CustomDio {

  final Dio client;

  CustomDio(this.client){
    client.options.baseUrl = BASE_URL;
    client.interceptors.add(CacheInterceptor());
    client.interceptors.add(BaseInterceptor());
  }
}