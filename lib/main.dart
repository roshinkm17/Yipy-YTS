import 'package:flutter/material.dart';
import 'package:yipy_yts/screens/favourites_screen.dart';
import 'package:yipy_yts/screens/groups_screen.dart';
import 'package:yipy_yts/screens/home_screen.dart';
import 'package:yipy_yts/screens/search_screen.dart';
import 'package:yipy_yts/utilities/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        FavouritesScreen.id: (context) => FavouritesScreen(),
        GroupScreen.id: (context) => GroupScreen(),
        NavigationBar.id: (context) => NavigationBar(),
      },
      initialRoute: NavigationBar.id,
    );
  }
}
