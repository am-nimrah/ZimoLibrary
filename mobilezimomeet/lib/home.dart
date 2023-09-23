import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamController<String> _textStreamController = StreamController<String>();
  PageController _backgroundController = PageController(initialPage: 0);
  List<String> dynamicTexts = [
    'ENJOY UNLIMITED GROUP VIDEO CALLS,\nNOISE SUPPRESSION, AND MORE.',
    'CLICK NEW MEETING TO GET A LINK OR CUSTOMIZE\nYOUR OWN UNIQUE LINK YOU CAN SEND TO\nPEOPLE YOU WANT TO MEET WITH',
    'CLICK NEW MEETING AND PLAN AHEAD TO\nSCHEDULE MEETINGS AND SEND INVITES\nTO PARTICIPANTS.',
    'END-TO-END ENCRYPTION TO PROTECT MESSAGES,\nVIDEOS, FILES, AND RECORDINGS FROM\nBEING INTERCEPTED AND READ BY CRIMINALS OR\nGOVERNMENTS.',
    'SCAN MEETINGS QR CODES TO ENABLE INSTANT\nMEETING ACCESS.',
    'VIEW FULL SCREEN MODE AND INVITE\nPARTICIPANTS IN REAL TIME.\n\nCHANGE AND CUSTOMIZE BACKGROUNDS.\n\nEMBED MEETINGS',
    'BREAKOUT ROOMS AND LOBBY MODE.\n\nSCREEN AND VIDEO SHARE.',
    '\n\nRECORD MEETINGS, SHARE FILES,\nSHARE VIDEOS, AND SHARE AUDIO.',
    '\n\nFREE FOR EVERYONE.',
  ];

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
  List<Color> backgroundColors = [
    Colors.white, // image1.svg
    Colors.white, // image2.svg
    Colors.white, // image3.svg
    Colors.black, // image4.svg
    Colors.white, // image5.svg
    Colors.black, // image6.svg
    Colors.white, // image7.svg
    Colors.black, // image8.svg
    Colors.white, // image9.svg
    Colors.white, // image10.svg
  ];
  int currentIndex = 0;
  Timer? textUpdateTimer;

  @override
  void initState() {
    super.initState();
    startUpdatingText();
  }

  @override
  void dispose() {
    _textStreamController.close();
    _backgroundController.dispose();
    textUpdateTimer?.cancel();
    super.dispose();
  }

  void startUpdatingText() {
    textUpdateTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      _textStreamController.sink.add(dynamicTexts[currentIndex]);
      currentIndex = (currentIndex + 1) % dynamicTexts.length;
      _backgroundController.animateToPage(
        currentIndex,
        duration: Duration(seconds: 1),
        curve: Curves.easeOut,
      );

      setState(() {});
    });
  }
  Color getCurrentBackgroundColor() {
    return backgroundColors[currentIndex];
  }

  Color getCurrentTextColor() {
    // Define the background colors that should have white text color
    List<Color> whiteBackgroundColors = [
      Colors.white,
      // Add any other background colors that should have white text color
    ];

    // Check if the current background color is in the whiteBackgroundColors list
    if (whiteBackgroundColors.contains(getCurrentBackgroundColor())) {
      return Colors.white; // Return white text color
    } else {
      return Colors.black; // Return black text color
    }
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
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _backgroundController,
                  itemCount: backgroundImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: backgroundColors[index],
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return SvgPicture.asset(
                            backgroundImages[index],
                            fit: BoxFit.fill,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                          );
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 4.0, 4.0, 2.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyDrawer()),
                            );
                          },
                          child: SvgPicture.asset(
                        'assets/menu_button.svg',
                        width: 26,
                        height: 26,
                      ),
                    ),
                  ),
                      Text(
                        'DISCOVER',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18.0,
                          color: getCurrentTextColor(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            'ONE PLATFORM',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 34.0,
                              color: getCurrentTextColor(),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(
                        children: [
                          Text(
                            'TOGETHER WE CREATE AND BUILD A BETTER WORLD',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 6.0,
                              color: getCurrentTextColor(),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(height: 20.0),
                      Center(
                        child: SvgPicture.asset(
                          'assets/zimomeet.svg',
                          width: 20,
                          height: 16,
                          // ignore: deprecated_member_use
                          color: getCurrentTextColor(),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Text(
                            'PREMIUM VIDEO  MEETINGS  INSTANT MEETINGS  CUSTOMIZED LINKS  CHAT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 9.0,
                              color: getCurrentTextColor(),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Text(
                            'END-TO-END ENCRYPTION  SCHEDULE MEETINGS  RECORDINGS  CAR MODE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 9.0,
                              color: getCurrentTextColor(),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Text(
                            'SCREEN SHARE   VIDEO SHARE   BREAKOUT ROOMS   LOBBY MODE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 9.0,
                              color: getCurrentTextColor(),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        children: [
                          Text(
                            'PASSWORD PROTECTED MEETING FREE FOR EVERYONE',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 9.0,
                              color: getCurrentTextColor(),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset('assets/new_meeting.svg'),
                              SizedBox(height: 10.0),
                              Text(
                                'NEW MEETING',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 6.0,
                                  color: getCurrentTextColor(),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          SizedBox(width: 10.0),
                          SvgPicture.asset('assets/zigzag.svg'),
                          SizedBox(width: 10.0),
                          Column(
                            children: [
                              SvgPicture.asset('assets/code_link.svg'),
                              SizedBox(height: 10.0),
                              Text(
                                'ENTER A CODE OR LINK',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 6.0,
                                  color: getCurrentTextColor(),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(height: 10.0),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StreamBuilder<String>(
                                  stream: _textStreamController.stream,
                                  initialData: dynamicTexts[0],
                                  builder: (context, snapshot) {
                                    return Text(
                                      snapshot.data!,
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 12.0,
                                        color: getCurrentTextColor(),
                                      ),
                                      textAlign: TextAlign.center,
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 30.0),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  // Add space between SVGs
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        8.0),
                              child: SvgPicture.asset('assets/meeting1.svg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('assets/meeting2.svg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('assets/meeting3.svg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('assets/meeting4.svg'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      ],
        ),
      ),
    ],
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