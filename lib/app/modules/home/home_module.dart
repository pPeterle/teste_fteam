import 'package:teste_inicial/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicial/app/modules/home/home_page.dart';
import 'package:teste_inicial/app/modules/home/pages/movies/movie_controller.dart';
import 'package:teste_inicial/app/repository/movie_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MovieRepository(i.get())),
        Bind((i) => HomeController()),
        Bind((i) => MovieController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
