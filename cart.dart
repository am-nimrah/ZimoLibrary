import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'checkout.dart';
import 'homemodel.dart';

class TimerCard {
  final String imagePath;
  final Duration countdownDuration;
  final VoidCallback onTimerUpdate;

  TimerCard({
    required this.imagePath,
    required this.countdownDuration,
    required this.onTimerUpdate,
  });

  // You might want to implement the timer functionality here.
  // Timer logic goes here...
  void startTimer() {
    // Start the timer logic here.
  }
}

class CartItem {
  final String id;
  final String title;
  final double price;
  int quantity;
  int ticket=100;
  final TimerCard timerCard;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.timerCard,
  });
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0;
  List<CartItem> cartItems = [];

  @override
  void initState() {
    super.initState();

    // Initialize cart items with TimerCard instances.
    cartItems = [
      CartItem(
        id: '1',
        title: 'ITEM 1',
        price: 450,
        quantity: 0,
        timerCard: TimerCard(
          imagePath: 'assets/properties/img_1.png',
          countdownDuration: Duration(days: 30, hours: 12, minutes: 0, seconds: 10),
          onTimerUpdate: () {
            // Handle timer update logic for ITEM 1 here.
          },
        ),
      ),
      CartItem(
        id: '2',
        title: 'ITEM 2',
        price: 500,
        quantity: 0,
        timerCard: TimerCard(
          imagePath: 'assets/properties/img_2.png',
          countdownDuration: Duration(days: 25, hours: 8, minutes: 30),
          onTimerUpdate: () {
            // Handle timer update logic for ITEM 2 here.
          },
        ),
      ),
      CartItem(
        id: '3',
        title: 'ITEM 3',
        price: 450,
        quantity: 0,
        timerCard: TimerCard(
          imagePath: 'assets/properties/img_3.png',
          countdownDuration: Duration(days: 20, hours: 18, minutes: 45),
          onTimerUpdate: () {
            // Handle timer update logic for ITEM 3 here.
          },
        ),
      // Assuming there are 120 tickets initially for ITEM 3.
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ...app bar configuration remains the same.
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          TimerCard timerCard = cartItems[index].timerCard;
          timerCard.startTimer(); // Start the timer for each item.

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // ...widget configurations for item image and timer.
                // Note: Use timerCard.countdownDuration to display the timer.
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'TOTAL: £$total',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(cartItems: cartItems),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    'CHECKOUT',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
