import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_inicial/app/modules/home/home_controller.dart';

class HomeBottomNavigation extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return BottomNavigationBar(
          currentIndex: controller.page,
          onTap: controller.setPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Polígonos'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
          ],
        );
      },
    );
  }
}
