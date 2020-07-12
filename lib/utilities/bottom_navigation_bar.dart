import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yipy_yts/constants.dart';
import 'package:yipy_yts/screens/favourites_screen.dart';
import 'package:yipy_yts/screens/groups_screen.dart';
import 'package:yipy_yts/screens/home_screen.dart';
import 'package:yipy_yts/screens/search_screen.dart';

class NavigationBar extends StatefulWidget {
  static String id = "navigation_bar_id";

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedPage = 0;
  List<Widget> pageList = List<Widget>();

  @override
  void initState() {
    super.initState();
    pageList.add(HomeScreen());
    pageList.add(SearchScreen());
    pageList.add(FavouritesScreen());
    pageList.add(GroupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPage,
        children: pageList,
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          elevation: 10,
          selectedIconTheme: IconThemeData(size: 20),
          unselectedIconTheme: IconThemeData(size: 16),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: bottomAppBarColor,
          selectedItemColor: selectedIconColor,
          unselectedItemColor: unselectedIconColor,
          currentIndex: _selectedPage,
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.search), title: Text("Search")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heart), title: Text("Favourites")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.comments), title: Text("Groups")),
          ],
        ),
      ),
    );
  }
}
