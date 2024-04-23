import 'package:flutter/material.dart';
import 'package:empty_app_test2/providers/app_state.dart';
import 'package:empty_app_test2/screens/favorite_screen.dart';
import 'package:empty_app_test2/screens/random_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: "Favorite",
      ),
    ];

    List<Widget> screens = [
      RandomScreen(pair: pair, appState: appState, icon: icon),
      const FavoriteScreen()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('2100016055'),
        backgroundColor: Color.fromARGB(255, 241, 151, 181), 
        elevation: 0, 
        flexibleSpace: Container( 
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 113, 55, 74)],
            ),
          ),
        ),
        centerTitle: true, 
        actions: <Widget>[
          IconButton( 
            icon: Icon(Icons.favorite),
            onPressed: () {
              
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: screens[currentIndex],
    );
  }
}
