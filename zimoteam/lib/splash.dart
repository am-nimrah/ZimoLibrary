import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  bool _firstImageVisible = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _firstImageVisible = false;
      });
    });
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 2),
          child: _firstImageVisible
              ? ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.white, // Change the color to white
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              'assets/ZIMO_ZIMOGROUP Logo.svg',
            ),
          )
              : SvgPicture.asset('assets/meet.svg'),
        ),
      ),
    );
  }
}
