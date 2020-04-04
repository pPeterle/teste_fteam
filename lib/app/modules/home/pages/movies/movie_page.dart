import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_inicial/app/modules/home/pages/movies/widgets/movie_controller.dart';
import 'package:teste_inicial/app/modules/home/pages/movies/widgets/movies_widget.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends ModularState<MoviesPage, MovieController> {
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) {
      if (controller.error != null) BotToast.showText(text: controller.error);
    });
  }

  @override
  void dispose() {
    disposer.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AnimatedSwitcher(
          duration: Duration(
            milliseconds: 300,
          ),
          child: controller.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: controller.fetchFilms,
                  child: ListView.builder(
                    itemBuilder: (context, index) => MovieWidget(
                      movie: controller.movies[index],
                    ),
                    itemCount: controller.movies.length,
                  ),
                ),
        );
      },
    );
  }
}
