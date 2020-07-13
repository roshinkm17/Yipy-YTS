import 'package:flutter/material.dart';
import 'package:yipy_yts/services/networking.dart';
import 'package:yipy_yts/utilities/builder.dart';
import 'package:yipy_yts/constants.dart';
import 'package:yipy_yts/utilities/movie_card.dart';

import 'movie_data.dart';

class MovieListCreator extends StatefulWidget {
  MovieListCreator({@required this.apiLink, @required this.genre});
  final String apiLink;
  final String genre;

  @override
  _MovieListCreatorState createState() => _MovieListCreatorState();
}

class _MovieListCreatorState extends State<MovieListCreator> {
  @override
  void initState() {
    super.initState();
    setState(() {
      apiLink = widget.apiLink;
      genre = widget.genre;
    });
  }

  getLatestMovieData() async {
    var data = await _helper.getData(apiLink);
    noOfMovies = data['data']['limit'];
    for (int i = 0; i < noOfMovies; i++) {
      MovieData _movieData = MovieData();
      _movieData.movieId = data['data']['movies'][i]['id'].toString();
      _movieData.title = data['data']['movies'][i]['title'];
      _movieData.year = data['data']['movies'][i]['year'].toString();
      _movieData.imageLink = data['data']['movies'][i]['medium_cover_image'];
      _movieData.language = data['data']['movies'][i]['language'];
      _movieData.summary = data['data']['movies'][i]['summary'];
      _movieData.rating = data['data']['movies'][i]['rating'].toString();
      _movieData.runtime = data['data']['movies'][i]['runtime'];
      _movieData.genres = data['data']['movies'][i]['genres'];
      _movieData.torrents = data['data']['movies'][i]['torrents'];
      setState(() {
        movieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  int noOfMovies;
  var movieArray = [];
  String apiLink;
  String genre;
  NetworkHelper _helper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "$genre",
          style: size16Medium,
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 30),
          height: 230,
          child: CustomBuilder(array: movieArray),
        ),
      ],
    );
  }
}
