import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'drawer.dart';

import 'theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true, // Center the title
        title: Image.asset(
          'assets/images/logo-removebg-preview.png',
          width: 100,
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.nightlight : Icons.sunny,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Capture-removebg-preview.png',
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
