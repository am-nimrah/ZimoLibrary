import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<String> backgroundImages = [
    'assets/image1.svg',
    'assets/image2.svg',
    'assets/image3.svg',
    'assets/image4.svg',
    'assets/image5.svg',
    'assets/image6.svg',
    'assets/image7.svg',
    'assets/image8.svg',
    'assets/image9.svg',
    'assets/image10.svg',
  ];

  int currentIndex = 0;
  Timer? backgroundUpdateTimer;

  @override
  void initState() {
    super.initState();
    startUpdatingBackground();
  }

  @override
  void dispose() {
    backgroundUpdateTimer?.cancel();
    super.dispose();
  }

  void startUpdatingBackground() {
    backgroundUpdateTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % backgroundImages.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 35,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/QR_logo.svg',
                width: 26,
                height: 26,
              ),
            ),
            SvgPicture.asset(
              'assets/ZM_logo.svg',
              width: 26,
              height: 26,
            ),
            SvgPicture.asset(
              'assets/lock.svg',
              width: 20,
              height: 20,
            ),
            SvgPicture.asset(
              'assets/flag_logo.svg',
              width: 26,
              height: 26,
            ),
          ],
        ),
      ),
      body: Stack(
          children: [
      Container(
      decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage(backgroundImages[currentIndex]),
      fit: BoxFit.cover,
    ),
    ),
    ),
    Drawer(
    child: Container(
    child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
    Center(
    child: SvgPicture.asset(
    'assets/zimomeet.svg',
    width: 20,
    height: 16,
    ),
    ),
    DefaultTextStyle(
    style: TextStyle(
    fontFamily: 'Lato',
    fontSize: 11,
    // Add more text styling properties if needed
    ),
    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text('START AN INSTANT MEETING'),
                        onTap: () {
                          // handle item 1 tap
                        },
                      ),
                      ListTile(
                        title: Text('CUSTOMIZE YOUR PERSONAL LINK'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('CREATE A MEETING FOR LATER'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('ENTER A CODE OR LINK'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('FEATURES'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('GROUPS'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('YOUR RECENT MEETINGS'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('MY ZM'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('ZM.LIVE'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('ZM BROADCAST'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('SETTINGS'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('CHANGE APP ICON'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('PARTNERS'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('ABOUT'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('HELP & FAQ'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('CONTACT'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                      ListTile(
                        title: Text('ENGLISH'),
                        onTap: () {
                          // handle item 2 tap
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    ),
      ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/minimeet.svg',
                  width: 26,
                  height: 26,
                ),
                SvgPicture.asset(
                  'assets/history.svg',
                  width: 26,
                  height: 26,
                ),
                SvgPicture.asset(
                  'assets/calender.svg',
                  width: 26,
                  height: 26,
                ),
                SvgPicture.asset(
                  'assets/settings.svg',
                  width: 26,
                  height: 26,
                ),
              ],
            ),
          ),
        ),
      );
  }
}