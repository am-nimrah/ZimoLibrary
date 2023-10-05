// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CheckoutPage extends StatelessWidget {
  final List<CartItem> cartItems;
  CheckoutPage({required this.cartItems});
  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in cartItems) {
      if (item.quantity > 0) {
        total += item.quantity * item.price;
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Text(
          'CHECKOUT',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          // ignore: duplicate_ignore
          SvgPicture.asset(
            'assets/zigzag.svg', // Add your zigzag icon asset
            width: 22,
            height: 18,           // ignore: deprecated_member_use
            color: Colors.black,
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          var item = cartItems[index];
          if (item.quantity > 0) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(item.timerCard.imagePath),
              ),
              title: Text(item.title),
              subtitle:
                  Text('PRICE: £${item.price}\nTICKET(S): ${item.quantity}'),
              trailing: Text('SUBTOTAL: £${item.quantity * item.price}'),
            );
          } else {
            return Container(); // Return an empty container for items with quantity 0
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL: £$total',
                style: TextStyle(fontSize: 16),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
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
      ),
    );
  }
}
