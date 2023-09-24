import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '    ENDING SOON',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/ending.png',
                height: 300,
                width: 500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '    JUST FOR YOU',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/for you.png',
                height: 300,
                width: 500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
