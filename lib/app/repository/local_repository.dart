import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_inicial/app/repository/model/Movie.dart';

class LocalRepository {
  final instance = SharedPreferences.getInstance();

  static const _KEY_MOVIES = 'movies-key';

  Future saveMovies(List<Movie> movies) async {
    return (await instance).setStringList(
        _KEY_MOVIES, movies.map((m) => jsonEncode(m.toJson())).toList());
  }

  Future<List> getMovies() async {
    final jsonList = (await instance).getStringList(_KEY_MOVIES);
    final map = jsonList.map((j) => jsonDecode(j)).toList();
    return map;
  }

  Future<bool> isMovieSaved() async =>
      (await instance).containsKey(_KEY_MOVIES); 
}
