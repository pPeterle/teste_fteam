// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  final _$loadingAtom = Atom(name: '_MovieControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$errorAtom = Atom(name: '_MovieControllerBase.error');

  @override
  String get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$moviesAtom = Atom(name: '_MovieControllerBase.movies');

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.context.enforceReadPolicy(_$moviesAtom);
    _$moviesAtom.reportObserved();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.context.conditionallyRunInAction(() {
      super.movies = value;
      _$moviesAtom.reportChanged();
    }, _$moviesAtom, name: '${_$moviesAtom.name}_set');
  }

  final _$favoritesAtom = Atom(name: '_MovieControllerBase.favorites');

  @override
  ObservableList<Movie> get favorites {
    _$favoritesAtom.context.enforceReadPolicy(_$favoritesAtom);
    _$favoritesAtom.reportObserved();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<Movie> value) {
    _$favoritesAtom.context.conditionallyRunInAction(() {
      super.favorites = value;
      _$favoritesAtom.reportChanged();
    }, _$favoritesAtom, name: '${_$favoritesAtom.name}_set');
  }

  final _$fetchFilmsAsyncAction = AsyncAction('fetchFilms');

  @override
  Future fetchFilms() {
    return _$fetchFilmsAsyncAction.run(() => super.fetchFilms());
  }

  final _$setFavoriteMovieAsyncAction = AsyncAction('setFavoriteMovie');

  @override
  Future setFavoriteMovie(Movie movie) {
    return _$setFavoriteMovieAsyncAction
        .run(() => super.setFavoriteMovie(movie));
  }

  @override
  String toString() {
    final string =
        'loading: ${loading.toString()},error: ${error.toString()},movies: ${movies.toString()},favorites: ${favorites.toString()}';
    return '{$string}';
  }
}
