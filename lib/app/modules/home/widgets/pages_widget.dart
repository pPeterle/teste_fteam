import 'package:flutter/material.dart';

class PagesWidget extends StatelessWidget {
  final List<Widget> children;
  final int paginaAtual;

  const PagesWidget({
    Key key,
    this.paginaAtual,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children
          .map(
            (c) => AnimatedOpacity(
              duration: Duration(
                milliseconds: 400,
              ),
              opacity: children.indexOf(c) == paginaAtual ? 1 : 0,
              curve: Curves.easeOut,
              child: Visibility(
                child: c,
                visible: children.indexOf(c) == paginaAtual,
                maintainState: true,
              ),
            ),
          )
          .toList(),
    );
  }
}
