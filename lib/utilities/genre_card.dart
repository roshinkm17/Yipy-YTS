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
          color: Colors.white,
          onPressed: () {},
          child: Text(
            genre,
            style: size12Medium.copyWith(fontSize: fontSize),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
