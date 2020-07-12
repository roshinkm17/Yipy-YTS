import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:yipy_yts/constants.dart';
import 'package:yipy_yts/services/movie_data.dart';
import 'package:yipy_yts/services/networking.dart';
import 'package:yipy_yts/services/torrent_download_button.dart';
import 'package:yipy_yts/utilities/genre_card.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails(this.movieData);
  final MovieData movieData;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    getCast();
    super.initState();
    final int hour = widget.movieData.runtime ~/ 60;
    final int minutes = widget.movieData.runtime % 60;
    setState(() {
      movieLength =
          '${hour.toString().padLeft(2, "0")}h${minutes.toString().padLeft(2, "0")}m';
    });
  }

  getCast() async {
    String castUrl = "https://yts.mx/api/v2/movie_details"
        ".json?movie_id=${widget.movieData.movieId}&with_images=false&with_cast=true";
    var result = await _helper.getData(castUrl);
    setState(() {
      widget.movieData.cast = result['data']['movie']['cast'];
      widget.movieData.cast == null
          ? itemCount = 0
          : itemCount = widget.movieData.cast.length.toDouble();
    });
  }

  double itemCount;
  String id;
  NetworkHelper _helper = NetworkHelper();
  String movieLength;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: height * 0.3,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(4, 4),
                                spreadRadius: 15,
                                blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100)),
                          color: Colors.blue,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.movieData.imageLink),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          FontAwesomeIcons.chevronLeft,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        right: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 4),
                                    spreadRadius: 5,
                                    blurRadius: 10)
                              ],
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                topLeft: Radius.circular(50),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "⭐  " + widget.movieData.rating,
                                style:
                                    size12Medium.copyWith(color: Colors.white),
                              ),
                              Text(
                                widget.movieData.year,
                                style:
                                    size12Medium.copyWith(color: Colors.white),
                              ),
                              Text(
                                movieLength,
                                style:
                                    size12Medium.copyWith(color: Colors.white),
                              ),
                              LikeButton(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.movieData.title,
                          style: size24Bold.copyWith(
                              color: Colors.white, fontSize: 28),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 25,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.movieData.genres.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GenreCard(
                                genre: widget.movieData.genres[index],
                                fontSize: 10,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: unselectedIconColor),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                hint: Text("Suggested Clubs"),
                                dropdownColor: Colors.black,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Poppins"),
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "Tarantino Fans "
                                      "Club",
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Brad Pitt Fans "
                                      "Club",
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Actions Movies Fans "
                                      "Club",
                                    ),
                                  ),
                                ],
                                onChanged: (value) {}),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Plot Summary",
                          style: size16Light.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 20),
                        Text(
                          widget.movieData.summary,
                          style: size12Light.copyWith(
                              color: Colors.white70, fontSize: 12),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Cast and Crew",
                          style: size16Light.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: itemCount == null
                                ? itemCount = 0
                                : itemCount.toInt(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(widget
                                                      .movieData.cast[index]
                                                  ['url_small_image'] ==
                                              null
                                          ? "https://img.icons8"
                                              ".com/fluent/48/000000/person-female"
                                              ".png"
                                          : widget.movieData.cast[index]
                                              ['url_small_image']),
                                      radius: 20,
                                    ),
                                    SizedBox(height: 10),
                                    AutoSizeText(
                                      widget.movieData.cast[index]['name'],
                                      style: size12Light.copyWith(
                                          color: Colors.white),
                                      minFontSize: 8,
                                      maxLines: 5,
                                    ),
                                    SizedBox(height: 0),
                                    Text(
                                      widget.movieData.cast[index]
                                          ['character_name'],
                                      style: size12Light.copyWith(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.movieData.torrents.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TorrentDownloadButton(
                                size: widget.movieData.torrents[index]['size'],
                                quality: widget.movieData.torrents[index]
                                    ['quality'],
                                type: widget.movieData.torrents[index]['type'],
                                downloadLink: widget.movieData.torrents[index]
                                    ['url'],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
