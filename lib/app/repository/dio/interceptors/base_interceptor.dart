import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class BaseInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.queryParameters.addAll({'format': 'json'});
    return options;
  }

  @override
  onResponse(Response response) async {
    if (response.statusCode == 200) {
      return response.data['results'];
    }
  }

  @override
  onError(DioError e) async {

    
    if (e.type == DioErrorType.RESPONSE) {
      if (e.response.statusCode == 404)
        return DioError(error: "Erro 404 // Rota Errada");
    }

    if(e.type == DioErrorType.DEFAULT) {
      final connectivityResult = await (Connectivity().checkConnectivity());
      print(connectivityResult);
      if(connectivityResult == ConnectivityResult.none)
      return DioError(error: 'Sem conecção com internet');
    }

    return e;
  }
}
