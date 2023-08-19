import 'package:flutter/material.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MaterialApp(
        title: 'App Icon Selection',
        theme: ThemeData(
          fontFamily: 'Lato',
        ),
        home: const AppIconsPage(),
      ),
    );
  }
}

class AppIconsPage extends StatefulWidget {
  const AppIconsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppIconsPageState createState() => _AppIconsPageState();
}

class _AppIconsPageState extends State<AppIconsPage> {
  int iconIndex = 0;

  List iconName = <String>['assets/icons/icon1.png', 'assets/icons/icon2.png','assets/icons/icon3.png'];
  double get kSpacing => 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Icon'),
        actions: [
          Padding( padding: const EdgeInsets.only(right: 16.0),child: Image.asset( 'assets/images/logo-removebg-preview.png',width: 100,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(kSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildIconTile(0),
            buildIconTile(1),
            buildIconTile(2),
            SizedBox(height: kSpacing),
            ElevatedButton(
              onPressed: changeAppIcon,
              child: const Text(
                'Set as App Icon',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconTile(int index) => Padding(
    padding: EdgeInsets.all(kSpacing / 2),
    child: GestureDetector(
      onTap: () => setState(() => iconIndex = index),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
        leading: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(
            iconName[index],
          ),
        ),
      ),
    ),
  );

  void changeAppIcon() async {
    try {
      if (await FlutterDynamicIcon.supportsAlternateIcons) {
        await FlutterDynamicIcon.setAlternateIconName(iconName[iconIndex]);
        debugPrint("App icon changed successfully");
        return;
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
    }
    debugPrint("Failed to change app Icon");
  }
}
class ThemeProvider with ChangeNotifier {
  String selectedTheme = 'theme1';
  void setTheme(String theme) {
    selectedTheme = theme;
    notifyListeners();
  }
}
