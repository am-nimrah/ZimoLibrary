import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class SearchScreen extends StatefulWidget {
  final Map<String, List<Contact>> contactsByLetter;

  const SearchScreen({Key? key, required this.contactsByLetter}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Contact> filteredContacts = [];
  TextEditingController searchController = TextEditingController();

  void _searchContacts(String searchTerm) {
    List<Contact> allContacts = widget.contactsByLetter.values.expand((element) => element).toList();
    List<Contact> matchedContacts = allContacts.where((contact) {
      return contact.displayName?.toLowerCase().contains(searchTerm.toLowerCase()) ?? false;
    }).toList();
    setState(() {
      filteredContacts = matchedContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Contacts'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/logo-removebg-preview.png',
              width: 100,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      filteredContacts = [];
                    });
                  },
                ),
              ),
              onChanged: _searchContacts,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text(contact.phones?.isNotEmpty == true ? contact.phones!.first.value ?? '' : ''),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
