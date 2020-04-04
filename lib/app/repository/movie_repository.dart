import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicial/app/repository/dio/constants.dart';
import 'package:teste_inicial/app/repository/local_repository.dart';

import 'dio/custom_dio.dart';
import 'model/Movie.dart';

class MovieRepository extends Disposable {
  final CustomDio _dio;
  final LocalRepository _localRepository;

  MovieRepository(this._dio, this._localRepository);

  Future<List<Movie>> fetchFilms() async {
    try {
      final response = await _dio.client.get(MOVIES_URL);
      return (response.data as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } on DioError catch (e) {
      return Future.error(e.error);
    }
  }

  Future<List<Movie>> fetchFavoritesFilms() async =>
    _localRepository.getFavoritesMovies();
  
  Future saveFavoriteMovie(Movie movie) async => _localRepository.saveFavoriteMovie(movie);

  @override
  void dispose() {}
}
