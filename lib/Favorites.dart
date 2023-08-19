import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class FavoritesScreen extends StatefulWidget {
  final Map<String, List<Contact>> contactsByLetter;

  const FavoritesScreen({Key? key, required this.contactsByLetter})
      : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Contact> favoriteContacts = []; // List to store favorite contacts

  // Method to toggle favorite status of a contact
  void toggleFavorite(Contact contact) {
    setState(() {
      if (favoriteContacts.contains(contact)) {
        favoriteContacts.remove(contact);
      } else {
        favoriteContacts.add(contact);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: widget.contactsByLetter.length,
        itemBuilder: (context, index) {
          final char = widget.contactsByLetter.keys.toList()[index];
          final contactsForLetter = widget.contactsByLetter[char] ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  char,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              for (final contact in contactsForLetter)
                ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text(
                    contact.phones?.isNotEmpty == true
                        ? contact.phones!.first.value ?? ''
                        : '',
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      favoriteContacts.contains(contact)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => toggleFavorite(contact),
                  ),
                ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
