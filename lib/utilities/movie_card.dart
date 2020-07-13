import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:yipy_yts/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yipy_yts/screens/movie_details.dart';
import 'package:yipy_yts/services/movie_data.dart';

class MovieCard extends StatelessWidget {
  MovieCard({this.movieData});
  final MovieData movieData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetails(movieData)));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(movieData.imageLink),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 8),
              AutoSizeText(
                movieData.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                minFontSize: 8,
                style: size12Medium,
                textAlign: TextAlign.center,
              ),
              Text(
                "⭐ " + movieData.rating,
                style: size12Medium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
