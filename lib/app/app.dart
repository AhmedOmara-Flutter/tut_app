import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp._internal(); //named Constructor

  int appState = 0;

  static final _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Test());
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  void updateAppState() {
    MyApp().appState = 11;
  }

  void getAppState() {
    print(MyApp().appState);
  }

  @override
  Widget build(BuildContext context) {
    return Text('${MyApp().appState}');
  }
}
