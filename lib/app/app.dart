import 'package:tut_app/app/app_imports.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

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
