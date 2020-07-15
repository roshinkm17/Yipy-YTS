import 'package:flutter/material.dart';
import 'package:yipy_yts/constants.dart';
import 'package:yipy_yts/services/movie_data.dart';
import 'package:yipy_yts/services/networking.dart';
import 'package:yipy_yts/utilities/movie_card.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SearchResults extends StatefulWidget {
  SearchResults(this.searchLink);
  final String searchLink;

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  initState() {
    super.initState();
    getMovieData();
  }

  getMovieData() async {
    setState(() {
      _isSaving = true;
    });
    var data = await _helper.getData(widget.searchLink);
    setState(() {
      _isSaving = false;
    });
    var number = data['data']['movie_count'];
    if (number == 0) {
      Navigator.pop(context);
      showDialog(
          barrierDismissible: true,
          context: (context),
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(20),
              title: Text(
                "Nothing Found :(",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: primaryColor,
              elevation: 4,
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "OK",
                    style: size16Medium.copyWith(color: Colors.white70),
                  ),
                  color: primaryColor,
                )
              ],
            );
          });
    }
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
        resultsMovieArray.add(MovieCard(
          movieData: _movieData,
        ));
      });
    }
  }

  var resultsMovieArray = [];
  NetworkHelper _helper = NetworkHelper();
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isSaving,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Search Results",
                  style: size16Medium,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      children:
                          List.generate(resultsMovieArray.length, (index) {
                        return resultsMovieArray[index];
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
