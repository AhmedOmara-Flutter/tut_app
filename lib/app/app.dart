import 'package:flutter/material.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('ThemeData Task'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Enabled Button'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: null,
              child: Text('Disabled Button'),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Tap Me'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Global Font Test',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(

                decoration: InputDecoration(
                  labelText: 'Enter Text',
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
