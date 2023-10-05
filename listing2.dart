import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/cart.dart'as c;
import 'package:home/counter.dart';
import 'package:home/proprty.dart';
import 'expandabletext.dart';
import 'timer.dart';
class Listing extends StatelessWidget {
  final TimerCard timerCard;

  Listing({required this.timerCard});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _readJsonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            Map<String, dynamic> jsonData = snapshot.data!;
            Property property = Property.fromJson(jsonData);
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Center(
                  child: SvgPicture.asset(
                    'assets/zigzag.svg',
                    height: 20,
                    width: 81.75,
                    color: Colors.white,
                  ),
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                backgroundColor: Colors.transparent,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 321,
                      width: 414,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(timerCard.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 20,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: TimerWidget(
                                  timerDuration: timerCard.countdownDuration),
                            ),
                          ),

                          Positioned(
                            left: 16,
                            bottom: 16,
                            child: SvgPicture.asset(
                              'assets/listing/camera.svg',
                              // Path to your left bottom SVG
                              height: 16,
                              width: 16,
                            ),
                          ),
                          Positioned(
                            left: 35,
                            bottom: 16,
                            child: SvgPicture.asset(
                              'assets/listing/count.svg',
                              // Path to your left bottom SVG
                              height: 16,
                              width: 16,
                            ),
                          ),
                          Positioned(
                            right: 18,
                            bottom: 16,
                            child: SvgPicture.asset(
                              'assets/listing/like.svg',
                              // Path to your right bottom SVG
                              height: 16,
                              width: 20,
                            ),
                          ),
                          Positioned(
                            right: 40,
                            bottom: 16,
                            child: SvgPicture.asset(
                              'assets/listing/back.svg',
                              // Path to your right bottom SVG
                              height: 16,
                              width: 20,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/listing/code.svg',
                                height: 10,
                                width: 6,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(child: Text(
                                    'SHELTON STREET  COVENT GARDEN  LONDON WCH2',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.black),
                                  ),),
                                  SizedBox(height: 2),
                                  Center(child: Text(
                                    'UNITED KINGDOM',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.black),
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/listing/map.svg',
                                height: 14,
                                width: 16,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                              SvgPicture.asset(
                                'assets/listing/book.svg',
                                height: 14,
                                width: 16,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/listing/civica.svg',
                                height: 15,
                                width: 10,
                                color: Colors.black,
                              ),
                              SizedBox(width: 40),
                              Center(
                                child: SvgPicture.asset(
                                  'assets/listing/flag.svg',
                                  height: 10,
                                  width: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/listing/code2.svg',
                                height: 8,
                                width: 8,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/listing/seperation.svg',
                              height: 0.5,
                              width: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        SvgPicture.asset(
                          'assets/listing/percent.svg',
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 80),
                        Center(child: Text(
                          '£5,000,000 GBP',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),),
                        SizedBox(width: 40),
                        SvgPicture.asset(
                          'assets/listing/sothebays.svg',
                          height: 25,
                          width: 71.52,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/listing/seperation.svg',
                              height: 0.5,
                              width: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            backgroundColor: Colors.black,
                            fixedSize: Size(160, 35), // Button size
                          ),
                          child: Stack(
                            children: [
                              Center(child: Text('ENTER NOW')), // Centered text
                              Positioned(
                                top: 0,
                                right: 0,
                                child: SvgPicture.asset(
                                  'assets/listing/code.svg', // SVG for button 1
                                  height: 8,
                                  width: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10),
                        // Adjust the spacing between buttons

                        // Second ElevatedButton
                        ElevatedButton(
                          onPressed: () {
                            // Add your button 2 action here
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Rounded corners
                            ),
                            fixedSize: Size(160, 35),
                            backgroundColor: Colors.black, // Button size
                          ),
                          child: Stack(
                              children: [
                                Center(child: Text('BUY ENTRY NOW')),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '£25.00 GBP',
                                        style: TextStyle(
                                            fontSize: 6, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/listing/code.svg',
                                    // SVG for button 2
                                    height: 8,
                                    width: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/listing/seperation.svg',
                              height: 0.5,
                              width: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PROPERTY TYPE    TENURE    YEAR OF BUILD    ARCHITECTURE',
                              style: TextStyle(
                                  fontSize: 8, color: Color(0xFFBE9F56)),
                            ),
                            SizedBox(height: 5),
                            // Add some space between the two text widgets
                            Text(
                              '    Detached            Freehold            1935            Modern',
                              style: TextStyle(
                                  fontSize: 8, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/listing/seperation.svg',
                              height: 0.5,
                              width: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BEDROOMS       BATHROOMS    RECEPTION ROOMS    OTHER ROOMS',
                              style: TextStyle(
                                  fontSize: 8, color: Color(0xFFBE9F56)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '                      6                                    5                                             4                                              7',
                              style: TextStyle(
                                  fontSize: 8, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NUMBER OF FLOORS (STORIES)                          FLOORING TYPES',
                              style: TextStyle(
                                  fontSize: 8, color: Color(0xFFBE9F56)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '                                        4                                                     Marble, Carpet, Hardwood',
                              style: TextStyle(
                                  fontSize: 8, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/listing/seperation.svg',
                              height: 0.5,
                              width: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'INTERIOR FEATURES',
                              style: TextStyle(
                                  fontSize: 8, color: Color(0xFFBE9F56)),
                            ),
                            SizedBox(height: 5),
                            // Add some space between the two text widgets
                            Text(
                              'Air conditioning   Swimming pool   Cinema room   Games room   Gym \n Spa   Sauna   Steam room   Bar Wine cellar   Fireplace',
                              style: TextStyle(
                                  fontSize: 8, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/listing/seperation.svg',
                              height: 0.5,
                              width: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'EXTERIOR FEATURES',
                              style: TextStyle(
                                  fontSize: 8, color: Color(0xFFBE9F56)),
                            ),
                            SizedBox(height: 5),
                            // Add some space between the two text widgets
                            Text(
                              'Tennis   Court    Swimming pool    Golf Course    Trees Woods',
                              style: TextStyle(
                                  fontSize: 8, color: Colors.black),
                            ),
                            SizedBox(height: 5),
                            // Add some space between the two text widgets
                            Text(
                              'Park   Lake   City    Panoramic    Ocean    Garage   Parking',
                              style: TextStyle(fontSize: 8, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/listing/seperation.svg',
                              height: 0.5,
                              width: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'LOT SIZE (LAND)               PROPERTY SQ. FT',
                              style: TextStyle(
                                  fontSize: 8, color: Color(0xFFBE9F56)),
                            ),
                            SizedBox(height: 5),
                            // Add some space between the two text widgets
                            Text(
                              '21 acres                         48,000 Sq. ft',
                              style: TextStyle(
                                  fontSize: 8, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/listing/seperation.svg',
                              height: 0.5,
                              width: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Property description',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFFBE9F56)),
                                ),
                              ),
                              SizedBox(height: 5), // Add
                              // Display property description
                              ExpandableText(
                                text: property.description ??
                                    'No description available',
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Interior features',
                                          style: TextStyle(fontSize: 12,
                                              color: Color(0xFFBE9F56)),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      ExpandableText(
                                        text: property.interiorFeatures ??
                                            'No interior features available',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Exterior features',
                                          style: TextStyle(fontSize: 12,
                                              color: Color(0xFFBE9F56)),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // Display exterior features
                                      ExpandableText(
                                        text: property.exteriorFeatures ??
                                            'No exterior features available',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Bedroom features',
                                          style: TextStyle(fontSize: 12,
                                              color: Color(0xFFBE9F56)),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // Display bedroom features
                                      ExpandableText(
                                        text: property.bedroomFeatures ??
                                            'No bedroom features available',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Bathroom features',
                                          style: TextStyle(fontSize: 12,
                                              color: Color(0xFFBE9F56)),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // Display bathroom features
                                      ExpandableText(
                                        text: property.bathroomFeatures ??
                                            'No bathroom features available',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Reception room features',
                                          style: TextStyle(fontSize: 12,
                                              color: Color(0xFFBE9F56)),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // Display reception room features
                                      ExpandableText(
                                        text: property.receptionRoomFeatures ??
                                            'No reception room features available',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Other room features',
                                          style: TextStyle(fontSize: 12,
                                              color: Color(0xFFBE9F56)),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // Display other room features
                                      ExpandableText(
                                        text: property.otherRoomFeatures ??
                                            'No other room features available',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Appliances',
                                          style: TextStyle(fontSize: 12,
                                              color: Color(0xFFBE9F56)),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // Display appliances
                                      ExpandableText(
                                        text: property.appliances ??
                                            'No appliances available',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Image.asset(
                                        'assets/listing/mapimg.png',
                                        width: 350,
                                        height: 230,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 321,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(timerCard.imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/listing/seperation.svg',
                                        height: 0.5,
                                        width: 150,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Image.asset(
                                        'assets/listing/img.png',
                                        width: 350,
                                        height: 230,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
Future<Map<String, dynamic>> _readJsonData() async {
  try {
    String data = await rootBundle.loadString('assets/property.json');
    print('JSON Data: $data');
    Map<String, dynamic> jsonData = json.decode(data);
    return jsonData;
  } catch (e) {
    print('Error loading JSON data: $e');
    throw e; // Rethrow the exception to handle it in the FutureBuilder
  }
}
