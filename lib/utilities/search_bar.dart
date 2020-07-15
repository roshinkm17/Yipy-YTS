import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yipy_yts/constants.dart';
import 'package:yipy_yts/screens/search_results_screen.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onSubmitted: (value) {
          var searchLink = apiLink + "?query_term=$value";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchResults(searchLink)));
        },
        style: TextStyle(color: Colors.white54),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          labelText: "Quick Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.search,
            color: Color(0x33ffffff),
            size: 14,
          ),
          filled: true,
          fillColor: Color(0xff212121),
          labelStyle: size14Medium.copyWith(color: Color(0x33ffffff)),
        ),
      ),
    );
  }
}
