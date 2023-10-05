import 'package:flutter/material.dart';
import 'home.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        fontFamily: 'Lato',
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Lato'),
          displayLarge: TextStyle(fontFamily: 'Lato', fontSize: 24.0),
        ),
      ),
    );
  }
}
