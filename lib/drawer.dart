import 'package:flutter/material.dart';
import 'appicon.dart';
import 'contactlist.dart';
import 'contactlist2.dart';
import 'calculator.dart';
import 'location.dart';

class MyDrawer extends StatelessWidget {
const MyDrawer({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
// Access the ThemeProvider using Provider.of or Consumer

return Drawer(
child: ListView(
padding: EdgeInsets.zero,
children: <Widget>[
          Container(
            height: 190, // Adjust the height as needed
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            child: Image.asset('assets/images/Capture-removebg-preview.png'), // Replace with your image asset path
          ),
          ListTile(
            leading: const Icon(Icons.calculate_outlined),
            title: const Text('Calculator'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalculatorScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.my_location_outlined),
            title: const Text('My Location'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  LocationScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail_outlined),
            title: const Text('Static Contact List'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ContactListScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.image_outlined),
            title: const Text('App Icons'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AppIconsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Dynamic Contact List'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ContactListScreen2()),
              );
            },
          ),
],
),
);
}
}