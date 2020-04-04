import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicial/app/modules/home/pages/movies/widgets/movie_controller.dart';
import 'package:teste_inicial/app/repository/model/Movie.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;
  final MovieController controller = Modular.get();

  MovieWidget({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movie.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text(
              movie.director,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: <Widget>[
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                      color: Colors.greenAccent[700],
                    ),
                    SizedBox(width: 8),
                    Text(
                      movie.releaseDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            movie.isFavorite ?? false ? Icons.favorite : Icons.favorite_border,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            controller.setFavoriteMovie(movie);
                          }),
                      SizedBox(width: 8),
                      Text(
                        'Favorite',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
