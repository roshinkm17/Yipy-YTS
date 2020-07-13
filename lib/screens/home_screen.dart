import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yipy_yts/services/movie_data.dart';
import 'package:yipy_yts/services/networking.dart';
import 'package:yipy_yts/utilities/builder.dart';
import 'package:yipy_yts/utilities/movie_card.dart';
import 'package:yipy_yts/utilities/search_bar.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen_id';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    getLatestMovieData();
    getRecommendedMovieData();
    getActionMovieData();
    getAnimationMovieData();
    getSciFiMovieData();
    getAdventureMovieData();
    getComedyMovieData();
    getRomanceMovieData();
    getCrimeMovieData();
    getHorrorMovieData();
    getThrillerMovieData();
  }

  getRecommendedMovieData() async {
    var recommendedMovieLink = apiLink + "?minimum_rating=8&sort=year";
    var data = await _helper.getData(recommendedMovieLink);
    var number = data['data']['limit'];
    for (int i = 0; i < number; i++) {
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
        recommendedMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getAnimationMovieData() async {
    var recommendedMovieLink = apiLink + "?genre=animation&sort_by=rating";
    var data = await _helper.getData(recommendedMovieLink);
    var noOfMovies = data['data']['limit'];
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
        animationMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getActionMovieData() async {
    var link = apiLink + "?genre=action&sort_by=rating";
    var data = await _helper.getData(link);
    var noOfMovies = data['data']['limit'];
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
        actionMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getLatestMovieData() async {
    var data = await _helper.getData(apiLink);
    var noOfMovies = data['data']['limit'];
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
        latestMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getSciFiMovieData() async {
    var data = await _helper.getData(apiLink + "?genre=sci-fi&sort_by=rating");
    var noOfMovies = data['data']['limit'];
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
        sciFiMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getAdventureMovieData() async {
    var data =
        await _helper.getData(apiLink + "?genre=adventure&sort_by=rating");
    var noOfMovies = data['data']['limit'];
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
        adventureMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getComedyMovieData() async {
    var data = await _helper.getData(apiLink + "?genre=comedy&sort_by=rating");
    var noOfMovies = data['data']['limit'];
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
        comedyMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getHorrorMovieData() async {
    var data = await _helper.getData(apiLink + "?genre=horror&sort_by=rating");
    var noOfMovies = data['data']['limit'];
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
        horrorMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getRomanceMovieData() async {
    var data = await _helper.getData(apiLink + "?genre=romance&sort_by=rating");
    var noOfMovies = data['data']['limit'];
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
        romanceMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getCrimeMovieData() async {
    var data = await _helper.getData(apiLink + "?genre=crime&sort_by=rating");
    var noOfMovies = data['data']['limit'];
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
        crimeMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  getThrillerMovieData() async {
    var data =
        await _helper.getData(apiLink + "?genre=thriller&sort_by=rating");
    var noOfMovies = data['data']['limit'];
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
        thrillerMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  var adventureMovieArray = [];
  var latestMovieArray = [];
  var actionMovieArray = [];
  var animationMovieArray = [];
  var recommendedMovieArray = [];
  var sciFiMovieArray = [];
  var comedyMovieArray = [];
  var horrorMovieArray = [];
  var romanceMovieArray = [];
  var crimeMovieArray = [];
  var thrillerMovieArray = [];
  NetworkHelper _helper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          FontAwesomeIcons.userAlt,
                          size: 16,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.white54,
                        radius: 20,
                      ),
                      SearchBar(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Recommended",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: recommendedMovieArray),
                  ),
                  Text(
                    "Latest",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: latestMovieArray),
                  ),
                  Text(
                    "Action",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: actionMovieArray),
                  ),
                  Text(
                    "Animation",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: animationMovieArray),
                  ),
                  Text(
                    "Sci-Fi",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: sciFiMovieArray),
                  ),
                  Text(
                    "Adventure",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: adventureMovieArray),
                  ),
                  Text(
                    "Comedy",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: comedyMovieArray),
                  ),
                  Text(
                    "Horror",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: horrorMovieArray),
                  ),
                  Text(
                    "Romance",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: romanceMovieArray),
                  ),
                  Text(
                    "Crime",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: crimeMovieArray),
                  ),
                  Text(
                    "Thriller",
                    style: size16Medium,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 230,
                    child: CustomBuilder(array: thrillerMovieArray),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
