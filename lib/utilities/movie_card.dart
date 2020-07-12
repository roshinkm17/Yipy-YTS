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
      margin: EdgeInsets.symmetric(horizontal: width * 0.3 / 2, vertical: 20),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  height: height * 0.6,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(5, 5))
                    ],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(movieData.imageLink)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetails(movieData)));
                        },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: Text(
                          "Details",
                          style: size12Medium.copyWith(color: Colors.white),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxHeight: 50),
                        child: LikeButton(
                          mainAxisAlignment: MainAxisAlignment.center,
                          likeCountAnimationType: LikeCountAnimationType.all,
                        ),
                        margin: EdgeInsets.only(left: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 200, maxWidth: 200, maxHeight: 50, minHeight: 10),
            child: AutoSizeText(
              movieData.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              minFontSize: 12,
              style: size24Bold.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            movieData.language,
            style: size12Medium.copyWith(
                color: Colors.white, fontWeight: FontWeight.w300),
          ),
          Text(
            movieData.year,
            style: size12Medium.copyWith(
                color: Colors.white, fontWeight: FontWeight.w300),
          ),
          Text(
            "⭐  " + movieData.rating,
            style: size12Medium.copyWith(
                fontWeight: FontWeight.w300, color: Colors.white),
          )
        ],
      ),
    );
  }
}
