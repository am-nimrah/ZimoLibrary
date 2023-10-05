import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/cart.dart' as c;
import 'package:home/counter.dart';
import 'listing2.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TimerCard? selectedImage;
  List<TimerCard> cart = [];
  bool isFavorite = false;
  void addToCart(TimerCard? imageCard) {
    if (imageCard != null) {
      setState(() {
        cart.add(imageCard);
      });
    }
  }
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
  Future<void> _loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/home.json');
    List<dynamic> jsonList = json.decode(jsonData);

    imageCards1 = jsonList.sublist(0, 5).map((json) => TimerCard.fromJson(json)).toList();
    imageCards2 = jsonList.sublist(5).map((json) => TimerCard.fromJson(json)).toList();
  }
  late List<TimerCard> imageCards1 ;
  late List<TimerCard> imageCards2 ;
  @override
  void initState() {
    super.initState();
    _loadJsonData();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {});
    });
  }
  late Timer _timer;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void _navigateToListingScreen(BuildContext context, TimerCard timerCard, Timer timer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Listing(
          timerCard: timerCard,
        ),
      ),
    );
  }


  Widget _buildImageCard(
      TimerCard timerCard,
      List<TimerCard> imageCards,
      int currentIndex,
      void Function() nextImage,
      void Function() previousImage,
      ) {
    final timeRemaining = timerCard.countdownDuration - Duration(seconds: _timer.tick);
    final days = timeRemaining.inDays;
    final hours = timeRemaining.inHours % 24;
    final minutes = timeRemaining.inMinutes % 60;
    final seconds = timeRemaining.inSeconds % 60;

    return GestureDetector(
      onTap: () {
        _navigateToListingScreen(context, timerCard,_timer);
      },

      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Your background image
          Image.asset(
            timerCard.imagePath,
            height: 501,
            width: 330,
            fit: BoxFit.cover,
          ),
          // Your timer display
      Positioned(
            top: 30.0,
            left: 40.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    '$days',
                    style: TextStyle(
                      fontSize: 29.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 40.0),
                  Text(
                    '$hours',
                    style: TextStyle(
                      fontSize: 29.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 45.0),
                  Text(
                    '$minutes',
                    style: TextStyle(
                      fontSize: 29.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 45.0),
                  Text(
                    '$seconds',
                    style: TextStyle(
                      fontSize: 29.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        Positioned(
          top: 60.0,
          left: 47.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Row(
              children: [
                Text(
                  'DAYS',
                  style: TextStyle(
                    fontSize: 7.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 52.0),
                Text(
                  'HOURS',
                  style: TextStyle(
                    fontSize: 7.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 52.0),
                Text(
                  'MINUTES',
                  style: TextStyle(
                    fontSize: 7.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 52.0),
                Text(
                  'SECONDS',
                  style: TextStyle(
                    fontSize: 7.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 100.0,
          right: 40.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Row(
              children: [
                Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
                SizedBox(width: 18.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          bottom: 240.0,
          child: GestureDetector(
            onTap: previousImage,
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
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 300.0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imageCards.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index
                          ? Color(0xFFBE9F56)
                          : Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 240.0,
          child: GestureDetector(
            onTap: nextImage,
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
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 140.0,
          left: 20.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Align(
                alignment: Alignment.center,
                child:Text(
                    'ADDRESS',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 130.0,
          left: 130.0,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.transparent,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Align(
                  alignment: Alignment.center,
                  child:Text(
                      'UNITED KINGDOM',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 90.0,
          right: 10.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Row(
              children: [
                SizedBox(width: 52.0),
                SvgPicture.asset(
                  'assets/circle.svg',
                  // ignore: deprecated_member_use
                  color: Color(0xFFBE9F56),
                  width: 29,
                  height: 29,
                ),
                SizedBox(width: 30.0),
                SvgPicture.asset(
                  'assets/savills.svg',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 95.0,
          left: 10.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Row(
              children: [
                SizedBox(width: 52.0),
                SvgPicture.asset(
                  'assets/zigzag.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                  width: 15,
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 100.0,
          left: 130.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '£5,000,000 GBP',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 90.0,
          left: 160.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/code.svg',
                    // ignore: deprecated_member_use
                    color: Colors.white,
                    width: 64,
                    height: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 441,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    selectedImage?.imagePath ?? 'assets/img_1.png',
                    width: 333,
                    height: 60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final currentImageCard1 = imageCards1[currentIndex1];
    final currentImageCard2 = imageCards2[currentIndex2];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SvgPicture.asset(
                'assets/menu.svg',
                height: 20,
                width: 81.75,
                // ignore: deprecated_member_use
                color:Colors.black,
              ),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/zigzag.svg',
              height: 20,
              width: 81.75,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => c.CartPage(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/shopping.svg',
                height: 20,
                width: 16.71,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 9.5),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/img_3.png',
                  width: 350,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 9.5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'CATEGORIES',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Adjust the value as per your preference
                      child: Image.asset(
                        'assets/watch.png',
                        height: 195.3,
                        width: 284,
                        fit: BoxFit.cover, // You can adjust the BoxFit property as per your requirement
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Adjust the value as per your preference
                      child: Image.asset(
                        'assets/realestate.png',
                        height: 195.3,
                        width: 284,
                        fit: BoxFit.cover, // You can adjust the BoxFit property as per your requirement
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Adjust the value as per your preference
                      child: Image.asset(
                        'assets/cars.png',
                        height: 195.3,
                        width: 284,
                        fit: BoxFit.cover, // You can adjust the BoxFit property as per your requirement
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'TRENDING',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 9.5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Adjust the value as per your preference
                      child: Image.asset(
                        'assets/trending1.png',
                        height: 133,
                        width: 194,
                        fit: BoxFit.cover, // You can adjust the BoxFit property as per your requirement
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Adjust the value as per your preference
                      child: Image.asset(
                        'assets/trending2.png',
                        height: 133,
                        width: 194,
                        fit: BoxFit.cover, // You can adjust the BoxFit property as per your requirement
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Adjust the value as per your preference
                      child: Image.asset(
                        'assets/trending3.png',
                        height: 133,
                        width: 194,
                        fit: BoxFit.cover, // You can adjust the BoxFit property as per your requirement
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'WISHLIST',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 6),
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
            SizedBox(height: 9.5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ENDING SOON',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _buildImageCard(
                        currentImageCard1,
                        imageCards1,
                        currentIndex1,
                        nextImage1,
                        previousImage1,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _buildImageCard(
                        currentImageCard2,
                        imageCards2,
                        currentIndex2,
                        nextImage2,
                        previousImage2,
                      ),
                    ],
                  ),
                ),
              ],
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
      if (currentIndex2 < imageCards2.length - 1) {
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
        currentIndex2 = imageCards2.length - 1;
      }
    });
  }
}
