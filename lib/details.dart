import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;

  ContactDetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo-removebg-preview.png',
                width: 80, height: 80),
            const SizedBox(width: 30),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.shopping_bag_outlined, size: 24, color: Colors.black),
              onPressed: () {
                // Implement filter action
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(
                  contact.displayName?[0] ?? '',
                  style: const TextStyle(fontSize: 36),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                contact.displayName ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Phone: ${contact.phones?.isNotEmpty == true ? contact.phones!.first.value ?? 'N/A' : 'N/A'}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Email: ${contact.emails?.isNotEmpty == true ? contact.emails!.first.value ?? 'N/A' : 'N/A'}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
