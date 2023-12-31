import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Colors.transparent,
                            BlendMode.srcIn,
                          ),
                          child: SvgPicture.asset(
                            'assets/ZIMO MEET B.svg',
                            width: 40.0,
                            height: 40.0,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '17:23 LONDON UNITED KINGDOM',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 9.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'SUNDAY, 12 FEBRUARY 2023',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 9.0,
                                color: Color(0xffb49f69),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.transparent,
                              BlendMode.srcIn,
                            ),
                            child: SvgPicture.asset(
                              'assets/UNITED KINGDOM.svg',
                              width: 40.0,
                              height: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'DISCOVER',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'ONE PLATFORM',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 26.0,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'TOGETHER, WE CREATE AND BUILD A BETTER WORLD.',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                            Image.asset(
                              'assets/ZM TXT BG Icon.png',
                              width: 150.0,
                              height: 200.0,
                            ),
                            const Text(
                              'PREMIUM VIDEO MEETINGS \n END TO END ENCRYPTION \n LOBBY MODE \n PASSWORD PROTECTED MEETINGS \n CUSTOMIZED LINKS \n FREE FOR EVERYONE \n RECORDINGS',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 1.0),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/ZM New Meeting Icon TRANS.svg',
                              width: 80.0,
                              height: 80.0,
                            ),
                            const Text(
                              'NEW MEETING',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                            Image.asset(
                              'assets/ZM Enter Code Link Icon Mobile TRANS.png',
                              width: 150.0,
                              height: 150.0,
                            ),
                            const Text(
                              'ENTER A CODE OR LINK',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/1 (2).png',
                              width: 150.0,
                              height: 150.0,
                            ),
                            const Text(
                              'ENJOY LONGER GROUP VIDEO CALLS \n NOISE SUPPRESSION AND \n MORE',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 1.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'ZIMO GROUP 2023',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w200,
                        fontSize: 8.0,
                        color: Colors.black,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/ZIMO_ZIMOGROUP Logo.svg',
                      height: 25.0,
                      width: 25.0,
                    ),
                    Image.asset(
                      'assets/Security Lock small.png',
                      width: 25.0,
                      height: 25.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
