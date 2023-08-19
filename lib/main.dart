import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'splash.dart';
import 'theme.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZimoCalc',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const SplashScreenWrapper(),
      builder: (context, child) {
        return DefaultTextStyle(
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          child: child!,
        );
      },
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}
class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
