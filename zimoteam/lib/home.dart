import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  bool isTextNotEmpty = false;

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {
        isTextNotEmpty = textController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: SvgPicture.asset(
                        'assets/zimomeet.svg',
                        width: 40.0,
                        height: 40.0,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                SizedBox(width: 8.0),
                                Text(
                                  '17:23 LONDON UNITED KINGDOM',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
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
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _showplannerPopup(context);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        color: Colors.black,
                                        size: 12.0,
                                      ),
                                      Text(
                                        'YOUR RECENT MEETINGS',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 9.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Icon(
                                        Icons.settings,
                                        color: Colors.black,
                                        size: 12.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(
                            'assets/UNITED KINGDOM.svg',
                            width: 20.0,
                            height: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'DISCOVER',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'ONE PLATFORM',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 26.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
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
                      Text(
                        'PREMIUM VIDEO MEETINGS \nEND TO END ENCRYPTION \nLOBBY MODE \nPASSWORD PROTECTED MEETINGS \nCUSTOMIZED LINKS \nFREE FOR EVERYONE \nRECORDINGS',
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
                SizedBox(height: 20.0),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                _showIconPopup(context);
                              },
                              child: SvgPicture.asset(
                                'assets/ZM New Meeting Icon TRANS.svg',
                                width: 80.0,
                                height: 80.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'NEW MEETING',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _showIconPopup2(context);
                              },
                              child: Image.asset(
                                'assets/ZM Enter Code Link Icon Mobile TRANS.png',
                                width: 80.0,
                                height: 80.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
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
                        SizedBox(width: 24.0),
                        Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/1 (2).png',
                              width: 150.0,
                              height: 150.0,
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'ENJOY LONGER GROUP VIDEO\nCALLS NOISE SUPPRESSION\nAND MORE',
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
                    SizedBox(height: 20.0),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        color: Colors.transparent, // Transparent background
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/company.svg',
                              height: 6.0,
                              width: 42.0,
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
                      ),
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

  void _showplannerPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Container(
            width: 300.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0, right: 1.0, top: 1.0),
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                  child: Text(
                    'YOUR RECENT MEETINGS',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Expanded(
                  child: ListView(
                    children: [
                      for (int i = 0; i < 10; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Text(
                                '05 MAY, 2023  MEETING WITH TEAM IN UK\n'
                                    '09:00               15:25    \n',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9.0,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              SvgPicture.asset(
                                'assets/delete.svg',
                                width: 13.7,
                                height: 13.7,
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
        );
      },
    );
  }

  void _showIconPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.link, color: Colors.black, size: 40.0),
                    SizedBox(height: 9.0),
                    Text(
                      'CREATE A MEETING FOR LATER',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _showIconPopup3(context);
                      },
                      child: SvgPicture.asset(
                        'assets/person.svg',
                        width: 35.0,
                        height: 35.0,
                      ),
                    ),
                    SizedBox(height: 9.0),
                    Text(
                      'CUSTOMIZE YOUR PERSONAL LINK',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _showIconPopup4(context);
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 40.0,
                      ),
                    ),
                    SizedBox(height: 9.0),
                    Text(
                      'START AN INSTANT MEETING',
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
          ),
        );
      },
    );
  }

  void _showIconPopup3(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5), // Set the background overlay opacity here (0.0 to 1.0)
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                _buildRow("CUSTOMIZE YOUR PERSONAL LINK", 8, 1.0, Colors.white),
                _buildRow("CUSTOMIZE YOUR MEETING NAME", 6, 3.0, Colors.grey),
                _buildRow("TYPE YOUR CUSTOMIZED MEETING NAME", 6, 3.0, Colors.white),
                _buildRow("COPY YOUR CUSTOMIZED PERSONAL LINK AND SEND IT TO PERSON YOU WANT TO MEET WITH.", 5.0, 10.0, Colors.grey),
                _buildRow("MAKE SURE TO SAVE IT TO USE IT LATER TOO", 6.0, 3.0, Colors.white),
                _buildRow("START YOUR PERSONALIZED INSTANT MEETING", 6.0, 3.0, Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SvgPicture.asset(
                        "assets/arrow.svg",
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          "assets/meet.svg",
                          width: 32,
                          height: 32,
                        ),
                        SizedBox(height: 16),
                        SvgPicture.asset(
                          "assets/fourset.svg",
                          width: 32,
                          height: 32,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: _buildLeftAlignedText("SHARE THIS MEETING LINK", Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: _buildLeftAlignedText("MORE OPTIONS", Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void _showIconPopup4(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                _buildRow("HERE IS THE LINK TO YOUR MEETING", 12, 1.0, Colors.white),
                _buildRow("COPY THIS LINK TO SEND IT TO PEOPLE YOU WANT TO MEET WITH", 6, 3.0, Colors.grey),
                _buildRow("zimomeet.com/alw-786-work", 7, 3.0, Colors.white),
                _buildRow("SHARE THE MEETING LINK TO OTHERS YOU WANT IN MEETING", 6.0, 10.0, Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SvgPicture.asset(
                        "assets/arrow.svg",
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          "assets/fourset.svg",
                          width: 48,
                          height: 48,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: _buildLeftAlignedText("SHARE THIS MEETING LINK", Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: _buildLeftAlignedText("MORE OPTIONS", Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget _buildLeftAlignedText(String text, Color color) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 6.0,
          color: color,
        ),
      ),
    );
  }
  Widget _buildRow(String text, double fontSize, double spacing, Color textColor) {
    return Container(
      width: double.infinity,
      color: Colors.transparent, // Adjust the background color here
      padding: EdgeInsets.symmetric(vertical: spacing),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor, // Set the text color here
        ),
      ),
    );
  }
  void _showIconPopup2(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/keyboard.svg',
                      height: 80.0,
                      width: 80.0,
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: textController,
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: 'ENTER A CODE OR LINK',
                      hintStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 120.0,
                    child: TextButton(
                      onPressed: () {
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                            return textController.text.isNotEmpty
                                ? Colors.black
                                : Colors.white;
                          },
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                            return Colors.white;
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'JOIN',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
