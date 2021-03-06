import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:bot_toast/bot_toast.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        navigatorKey: Modular.navigatorKey,
        navigatorObservers: [BotToastNavigatorObserver()],
        title: 'Flutter Slidy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
