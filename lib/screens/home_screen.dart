import 'package:flutter/material.dart';
import 'package:yipy_yts/services/movie_data.dart';
import 'package:yipy_yts/services/networking.dart';
import 'package:yipy_yts/utilities/genre_card.dart';
import 'package:yipy_yts/utilities/movie_card.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen_id';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    data = await _helper.getData(apiLink);
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
  var data;
  var movieArray = [];

  NetworkHelper _helper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 10,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: movieArray.length,
                itemBuilder: (BuildContext context, int index) {
                  return movieArray[index];
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: genreArray.length,
                itemBuilder: (BuildContext context, int index) {
                  return GenreCard(
                    genre: genreArray[index],
                    fontSize: 12,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
