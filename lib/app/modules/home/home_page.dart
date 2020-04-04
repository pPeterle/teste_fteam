import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicial/app/modules/home/pages/movies/movie_page.dart';
import 'package:teste_inicial/app/modules/home/pages/polygons/polygons_page.dart';
import 'home_controller.dart';
import 'widgets/home_bottom_navigation.dart';
import 'widgets/pages_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          return PagesWidget(
            paginaAtual: controller.page,
            children: <Widget>[
              PolygonsPage(),
              MoviesPage(),
              Container(),
            ],
          );
        },
      ),
      bottomNavigationBar: HomeBottomNavigation(),
    );
  }
}
