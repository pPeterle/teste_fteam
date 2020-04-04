import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicial/app/repository/local_repository.dart';
import 'package:teste_inicial/app/repository/model/Movie.dart';

import '../constants.dart';

class CacheInterceptor extends InterceptorsWrapper {
  final LocalRepository _localRepository = Modular.get();

  @override
  onResponse(Response response) async {
    if (response.statusCode == 200) {
      final data = response.data['results'];
      final movies =
          (data as List).map((data) => Movie.fromJson(data)).toList();
      _localRepository.saveMovies(movies);
    }
    return response;
  }

  @override
  onError(DioError e) async {

    print(e);
    
    if (e.request.path == MOVIES_URL) {
      final isSaved = await _localRepository.isMovieSaved();
      if (isSaved) {
        final movies = await _localRepository.getMovies();
        return Response(data: movies);
      }
    }

    return e;
  }
  
}
