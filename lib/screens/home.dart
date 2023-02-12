import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_teller/screens/empty_screen.dart';
import 'package:story_teller/state_managers/app_state_manager.dart';
import '../services/category_service.dart';
import '../state_managers/shared_prefs.dart';
import 'screens.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 0;
  final mockService = CategoryService();
  bool _mode = false;

  static List<Widget> pages = <Widget>[
    Generate(),
    History(),
    EmptyScreen(),
    Favorite(),
  ];

  @override
  Widget build(BuildContext context) {
    var mode = Provider.of<SharedPrefs>(context, listen: false);
    _mode = mode.darkMode;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.title), actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: _mode
                      ? const Icon(
                          Icons.light_mode,
                          color: Color.fromARGB(255, 242, 255, 201),
                          size: 30.0,
                        )
                      : Icon(
                          Icons.dark_mode,
                          color: Color.fromARGB(255, 19, 0, 102),
                          size: 30.0,
                        ),
                  onPressed: () {
                    setState(() {
                      _mode = mode.darkMode;
                    });
                    mode.darkMode = !mode.darkMode;
                    print(mode.darkMode.toString());
                  }),
            )
          ],
        ),
      ]),
      body: pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedTab,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fitbit_outlined),
            label: 'Generate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  Widget getScreen(screen) {
    return EmptyScreen();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
}
