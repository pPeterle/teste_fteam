import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_inicial/app/repository/local_repository.dart';
import 'package:teste_inicial/app/repository/model/Movie.dart';
import 'package:teste_inicial/app/repository/movie_repository.dart';
part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  final MovieRepository _repository = Modular.get();
  final LocalRepository _localRepository = Modular.get();

  @observable
  bool loading = false;

  @observable
  String error;

  @observable
  ObservableList<Movie> movies = ObservableList();

  _MovieControllerBase(){
    fetchFilms();
  }

  @action
  fetchFilms() async {
    loading = true;
    try {
      movies = (await _repository.fetchFilms()).asObservable();
    } catch (e) {
      print(e);
      error = e;
    }
    loading = false;
  }

  @action
  setFavoriteMovie(Movie movie) async {
    movie.isFavorite = !(movie.isFavorite ?? false);
    await _localRepository.saveMovies(movies);
    await fetchFilms();
  }
}
