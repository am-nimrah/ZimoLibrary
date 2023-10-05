import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<String> imagePaths = [
    'assets/properties/bruno-martins-GkZvxVsHYWw-unsplash.png',
    'assets/properties/img_4.png',
    'assets/properties/img_5.png',
    'assets/properties/img_6.png',
    'assets/properties/img_7.png',
  ];
  List<String> imagePaths2 = [
    'assets/properties/img_8.png',
    'assets/properties/img_9.png',
    'assets/properties/img_10.png',
    'assets/properties/img_11.png',
    'assets/properties/img_12.png',
    'assets/properties/img_13.png',
  ];
  int currentIndex1 = 0;
  int currentIndex2 = 0;

  Duration countdownDuration = Duration(
    days: 79,
    hours: 13,
    minutes: 20,
    seconds: 3,
  );

  void nextImage1() {
    setState(() {
      if (currentIndex1 < imagePaths.length - 1) {
        currentIndex1++;
      } else {
        currentIndex1 = 0;
      }
    });
  }

  void previousImage1() {
    setState(() {
      if (currentIndex1 > 0) {
        currentIndex1--;
      } else {
        currentIndex1 = imagePaths.length - 1;
      }
    });
  }

  void nextImage2() {
    setState(() {
      if (currentIndex2 < imagePaths2.length - 1) {
        currentIndex2++;
      } else {
        currentIndex2 = 0;
      }
    });
  }

  void previousImage2() {
    setState(() {
      if (currentIndex2 > 0) {
        currentIndex2--;
      } else {
        currentIndex2 = imagePaths2.length - 1;
      }
    });
  }

  bool isHeartFilled = false;

  void toggleHeart() {
    setState(() {
      isHeartFilled = !isHeartFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: <Widget>[
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/zigzag.svg',
                height: 20,
                width: 30,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              'assets/shopping.svg',
              height: 20,
              width: 16.71,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/banglow.png',
                height: 250,
                width: 350,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '       CATEGORIES',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/watches.svg',
                      height: 195.3,
                      width: 284,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/realestate.png',
                      height: 195.3,
                      width: 284,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/cars.png',
                      height: 195.3,
                      width: 284,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '       TRENDING',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/trending1.png',
                      height: 195.3,
                      width: 284,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/trending2.png',
                      height: 195.3,
                      width: 284,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/trending3.png',
                      height: 195.3,
                      width: 284,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '       WISHLIST',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.transparent,
                        child: SvgPicture.asset(
                          'assets/wishlist1.svg',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/wish2.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.transparent,
                        child: SvgPicture.asset(
                          'assets/wishlist3.svg',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.transparent,
                        child: SvgPicture.asset(
                          'assets/wishlist4.svg',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/wish3.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.transparent,
                        child: SvgPicture.asset(
                          'assets/wishlist6.svg',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '  ENDING SOON',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // Handle tap on the image card
                              },
                              child: Image.asset(
                                imagePaths[currentIndex1],
                                height: 501,
                                width: 372.03,
                              ),
                            ),
                            Positioned(
                              top: 40.0,
                              right: 90.0,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle share button tap
                                },
                                child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 40.0,
                              right: 30.0,
                              child: GestureDetector(
                                onTap: toggleHeart,
                                child: Icon(
                                  Icons.favorite,
                                  color: isHeartFilled
                                      ? Colors.red
                                      : Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16.0,
                              bottom: 16.0,
                              child: GestureDetector(
                                onTap: previousImage1,
                                child: Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/back.svg',
                                      height: 16.39,
                                      width: 11.73,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 16.0,
                              bottom: 16.0,
                              child: GestureDetector(
                                onTap: nextImage1,
                                child: Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/next.svg',
                                      height: 16.39,
                                      width: 11.73,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16.0,
                              top: 20.0,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                color: Colors.black.withOpacity(0.7),
                                child: Text(
                                  'Ending Soon',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'JUST FOR YOU',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // Handle tap on the image card
                              },
                              child: Image.asset(
                                imagePaths2[currentIndex2],
                                height: 501,
                                width: 372.03,
                              ),
                            ),
                            Positioned(
                              top: 20.0,
                              right: 90.0,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle share button tap
                                },
                                child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20.0,
                              right: 30.0,
                              child: GestureDetector(
                                onTap: toggleHeart,
                                child: Icon(
                                  Icons.favorite,
                                  color: isHeartFilled
                                      ? Colors.red
                                      : Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16.0,
                              bottom: 16.0,
                              child: GestureDetector(
                                onTap: previousImage2,
                                child: Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/back.svg',
                                      height: 16.39,
                                      width: 11.73,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 16.0,
                              bottom: 16.0,
                              child: GestureDetector(
                                onTap: nextImage2,
                                child: Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/next.svg',
                                      height: 16.39,
                                      width: 11.73,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16.0,
                              top: 20.0,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                color: Colors.black.withOpacity(0.7),
                                child: Text(
                                  'Just for You',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {},
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/search.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/filter.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/like.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/person.svg'),
            label: '',
          ),
        ],
      ),
    );
  }
}
