import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Favorites.dart';
import 'details.dart';
import 'search.dart';

class ContactListScreen2 extends StatefulWidget {
  const ContactListScreen2({Key? key}) : super(key: key);

  @override
  _ContactListScreen2State createState() => _ContactListScreen2State();
}

class _ContactListScreen2State extends State<ContactListScreen2> {
  int totalContacts = 0;
  Map<String, List<Contact>> contactsByLetter = {};
  List<String> alphabetList = List.generate(
      26, (index) => String.fromCharCode(65 + index));

  Color? _bodyLargeTextColor;
  Color? _bodyMediumTextColor;

  bool isLoading = true;
  Contact? selectedContact;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bodyLargeTextColor = Theme.of(context).textTheme.bodyLarge?.color;
    _bodyMediumTextColor = Theme.of(context).textTheme.bodyLarge?.color;
  }

  @override
  void initState() {
    super.initState();
    fetchTotalContacts().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> fetchTotalContacts() async {
    final PermissionStatus status = await Permission.contacts.request();
    if (status.isGranted) {
      final Iterable<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        totalContacts = contacts.length;
        contactsByLetter = organizeContactsByLetter(contacts);
      });
    }
  }

  Map<String, List<Contact>> organizeContactsByLetter(
      Iterable<Contact> contacts) {
    final Map<String, List<Contact>> organizedMap = {};

    for (int i = 0; i < 26; i++) {
      final char = String.fromCharCode(65 + i);
      final filteredContacts = contacts
          .where((contact) => contact.displayName?.startsWith(char) ?? false)
          .toList();

      if (filteredContacts.isNotEmpty) {
        organizedMap[char] = filteredContacts;
      }
    }

    return organizedMap;
  }

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
              icon: Icon(Icons.shopping_bag_outlined, size: 24,color: Colors.black),
              onPressed: () {
                // Implement filter action
              },
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  'Total: $totalContacts',
                  style: const TextStyle(
                      fontSize: 18, color: Colors.black),
                ),
                Spacer(),
                SizedBox(width: 4),
                Text('CONTACTS', style: TextStyle(fontSize: 18)),
                Spacer(),
                SizedBox(width: 4),
                IconButton(
                  icon: Icon(Icons.add, size: 24),
                  onPressed: () {
                    // Implement filter action
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: 26,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      final char = alphabetList[index];
                      final contactsForLetter =
                          contactsByLetter[char] ?? [];

                      if (contactsForLetter.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                char,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato'),
                              ),
                            ),
                            for (final contact in contactsForLetter)
                              Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ContactDetailScreen(contact: contact), // Navigate to details screen
                                        ),
                                      );
                                    },
                                    title: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            contact.displayName ?? '',
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: _bodyLargeTextColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        if (contact.displayName
                                            ?.contains('Zimo') ==
                                            true)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: ColorFiltered(
                                              colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .iconTheme
                                                    .color!,
                                                BlendMode.srcIn,
                                              ),
                                              child: Image.asset(
                                                'assets/images/Capture-removebg-preview.png',
                                                width: 60,
                                                height: 60,
                                              ),
                                            ),
                                          ),
                                        if (contact.displayName
                                            ?.contains('Zimo') !=
                                            true)
                                          Text(
                                            'Invite',
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 14,
                                              color: _bodyMediumTextColor,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 1,
                                  ),
                                ],
                              ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
                Container(
                  width: 20,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      for (final char in alphabetList)
                        Expanded(
                          child: InkWell(
                            onTap: () => _scrollToAlphabet(char),
                            child: Text(
                              char,
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).brightness ==
                                    Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.search, size: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchScreen(contactsByLetter: contactsByLetter),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.filter_list_outlined, size: 24),
              onPressed: () {
                // Navigate to filter screen
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite, size: 24, color: Colors.red),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoritesScreen(contactsByLetter: contactsByLetter),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person, size: 24),
              onPressed: () {
                // Navigate to add contact screen
              },
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToAlphabet(String alphabet) {
    final scrollController = PrimaryScrollController.of(context);
    final scrollOffset = scrollController.position.maxScrollExtent *
        (contactsByLetter.keys.toList().indexOf(alphabet) /
            contactsByLetter.keys.length);
    scrollController.animateTo(
      scrollOffset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
