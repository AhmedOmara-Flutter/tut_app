import 'package:flutter/material.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  MyApp._internal(); //named Constructor

  int appState = 0;

  static final _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getThemeDataApplication(),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
