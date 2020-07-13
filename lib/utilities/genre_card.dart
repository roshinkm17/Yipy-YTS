import 'package:flutter/material.dart';
import 'package:yipy_yts/constants.dart';

class GenreCard extends StatelessWidget {
  GenreCard({@required this.genre, @required this.fontSize});
  final String genre;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Center(
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          color: primaryColor,
          onPressed: () {},
          child: Text(
            genre,
            style: size10Light.copyWith(fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
