import 'package:flutter/material.dart';

import 'FavouriteScreen.dart';
import 'HomeScreen.dart';

class MainScreen extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}
 
class MainScreenState extends State<MainScreen> {
  int selectPage = 0;
  final pages = [HomeScreen(), FavouriteScreen()];
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          )
        ],
        currentIndex: selectPage,
        onTap: (value) {
          setState(() {
            selectPage = value;
          });
        },
        selectedItemColor: Color.fromARGB(255, 164, 69, 69),
        selectedFontSize: 20,
        unselectedFontSize: 14,
      ),
    );
    
  }
}
