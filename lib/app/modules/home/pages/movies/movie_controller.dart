import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_inicial/app/repository/model/Movie.dart';
import 'package:teste_inicial/app/repository/movie_repository.dart';
part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  final MovieRepository _repository = Modular.get();

  @observable
  bool loading = false;

  @observable
  String error;

  @observable
  ObservableList<Movie> movies = ObservableList();
  @observable
  ObservableList<Movie> favorites = ObservableList();

  _MovieControllerBase() {
    fetchFilms();
  }

  @action
  fetchFilms() async {
    loading = true;
    try {
      movies = (await _repository.fetchFilms()).asObservable();
      favorites = (await _repository.fetchFavoritesFilms())
          .asObservable();
    } catch (e) {
      print(e);
      error = e.message;
    }
    loading = false;
  }

  @action
  setFavoriteMovie(Movie movie) async {
    try {
      await _repository.saveFavoriteMovie(movie);
      favorites = (await _repository.fetchFavoritesFilms())
          .asObservable();
    } catch (e) {
      print(e);
      error = e.message;
    }
  }
}
