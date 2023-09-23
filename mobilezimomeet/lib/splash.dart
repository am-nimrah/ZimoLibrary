import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home.dart';
import 'dart:async';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  final double bottomIconSpacing = 16.0; // Adjust the spacing as needed

  // Define a list of splash screen data
  final List<SplashScreenData> splashScreens = [
    SplashScreenData(
      backgroundImagePath: "assets/bck1.svg",
      centerIconPath: "assets/zimomeet.svg",
      bottomIconPath: "assets/ZM_logo.svg",
      centerIconWidth: 75.0,
      centerIconHeight: 50.0,
      bottomIconWidth: 25.0,
      bottomIconHeight: 18.0,
    ),
    SplashScreenData(
      backgroundImagePath: "assets/bck1.svg",
      centerIconPath: "assets/meet.svg",
      bottomIconPath: "assets/ZM_logo.svg",
      centerIconWidth: 100.0,
      centerIconHeight: 100.0,
      bottomIconWidth: 25.0,
      bottomIconHeight: 18.0,
    ),
    SplashScreenData(
      backgroundImagePath: "assets/bck1.svg",
      centerIconPath: "assets/zimomeet2.svg",
      bottomIconPath: "assets/ZM_logo2.svg",
      centerIconWidth: 75.0,
      centerIconHeight: 50.0,
      bottomIconWidth: 25.0,
      bottomIconHeight: 18.0,
    ),
    SplashScreenData(
      backgroundImagePath: "assets/bck1.svg",
      centerIconPath: "assets/meet2.svg",
      bottomIconPath: "assets/ZM_logo2.svg",
      centerIconWidth: 100.0,
      centerIconHeight: 100.0,
      bottomIconWidth: 25.0,
      bottomIconHeight: 18.0,
    ),
    SplashScreenData(
      backgroundImagePath: "assets/bck2.svg",
      centerIconPath: "assets/zimomeet3.svg",
      bottomIconPath: "assets/ZM_logo3.svg",
      centerIconWidth: 75.0,
      centerIconHeight: 50.0,
      bottomIconWidth: 25.0,
      bottomIconHeight: 18.0,
    ),
    SplashScreenData(
      backgroundImagePath: "assets/bck2.svg",
      centerIconPath: "assets/meet3.svg",
      bottomIconPath: "assets/ZM_logo3.svg",
      centerIconWidth: 100.0,
      centerIconHeight: 100.0,
      bottomIconWidth: 25.0,
      bottomIconHeight: 18.0,
    ),
    SplashScreenData(
      backgroundImagePath: "assets/bck2.svg",
      centerIconPath: "assets/zimomeet2.svg",
      bottomIconPath: "assets/ZM_logo2.svg",
      centerIconWidth: 75.0,
      centerIconHeight: 50.0,
      bottomIconWidth: 25.0,
      bottomIconHeight: 18.0,
    ),
    SplashScreenData(
      backgroundImagePath: "assets/bck2.svg",
      centerIconPath: "assets/meet2.svg",
      bottomIconPath: "assets/ZM_logo2.svg",
      centerIconWidth: 100.0,
      centerIconHeight: 100.0,
      bottomIconWidth: 25.0,
      bottomIconHeight: 18.0,
    ),
  ];

  @override
  void initState() {
    super.initState();

    // Set up an automatic page transition timer
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (currentPage < splashScreens.length - 1) {
        currentPage++;
        _pageController.animateToPage(
          currentPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      } else {
        timer.cancel();
        // After all screens have been shown, navigate to the home screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        itemCount: splashScreens.length,
        itemBuilder: (context, index) {
          final data = splashScreens[index];
          return buildSplashScreen(data);
        },
      ),
    );
  }

  Widget buildSplashScreen(SplashScreenData data) {
    return Stack(
      children: [
        SvgPicture.asset(
          data.backgroundImagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  data.centerIconPath,
                  width: data.centerIconWidth,
                  height: data.centerIconHeight,
                ),
              ),
            ),
            SizedBox(
              height: bottomIconSpacing,
            ),
            SvgPicture.asset(
              data.bottomIconPath,
              width: data.bottomIconWidth,
              height: data.bottomIconHeight,
            ),
            SizedBox(
              height: bottomIconSpacing, // Add spacing below the bottom SVG
            ),
          ],
        ),
      ],
    );
  }
}

class SplashScreenData {
  final String backgroundImagePath;
  final String centerIconPath;
  final String bottomIconPath;
  final double centerIconWidth;
  final double centerIconHeight;
  final double bottomIconWidth;
  final double bottomIconHeight;

  SplashScreenData({
    required this.backgroundImagePath,
    required this.centerIconPath,
    required this.bottomIconPath,
    required this.centerIconWidth,
    required this.centerIconHeight,
    required this.bottomIconWidth,
    required this.bottomIconHeight,
  });
}