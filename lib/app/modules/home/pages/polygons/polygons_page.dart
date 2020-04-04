import 'package:flutter/material.dart';
import 'package:teste_inicial/app/modules/home/pages/polygons/polygons_custom_clipper.dart';

class PolygonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: ClipPath(
              clipper: PolygonsCustomClipper(index + 3),
              child: Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
            ),
          );
        },
      );
  }
}