import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yipy_yts/screens/search_results_screen.dart';
import 'package:yipy_yts/utilities/search_bar.dart';

import '../constants.dart';

class SearchScreen extends StatefulWidget {
  static String id = "search_screen_id";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  createSearchLink() {
    print(_qualityValue);
    String searchLink = apiLink;
    if (_ratingValue == null) {
      if (_orderValue == null) {
        if (_genreValue == null) {
          if (_qualityValue == null) {
            return apiLink;
          }
        }
      }
    }

    searchLink = apiLink + "?";
    if (_ratingValue != null) {
      searchLink = searchLink + "minimum_rating=$_ratingValue&";
    }
    if (_orderValue != null) {
      searchLink = searchLink + "order_by=$_orderValue&";
    }
    if (_genreValue != null) {
      searchLink = searchLink + "genre=$_genreValue&";
    }
    if (_qualityValue != null) {
      searchLink = searchLink + "quality=$_qualityValue&";
    }
    if (searchLink.endsWith("&")) {
      searchLink = searchLink.substring(0, searchLink.length - 1);
    }
    print(searchLink);
    return searchLink;
  }

  var _ratingValue;
  var _orderValue;
  var _genreValue;
  var _qualityValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 12, right: 12, top: 30),
          child: ListView(
            children: <Widget>[
              SearchBar(),
              SizedBox(height: 20),
              Text(
                "OR",
                style: size12Medium.copyWith(
                  color: Colors.white54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              DropdownButtonHideUnderline(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff212121),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: Color(0xff212121),
                    style: TextStyle(color: Color(0x33ffffff)),
                    value: _ratingValue,
                    hint: Text(
                      "Ratings",
                      style: size16Medium.copyWith(color: Color(0x33ffffff)),
                    ),
                    items: [
                      DropdownMenuItem(child: Text("All"), value: 0),
                      DropdownMenuItem(child: Text("9 or above"), value: 9),
                      DropdownMenuItem(child: Text("8 or above"), value: 8),
                      DropdownMenuItem(child: Text("7 or above"), value: 7),
                      DropdownMenuItem(child: Text("6 or above"), value: 6),
                      DropdownMenuItem(child: Text("5 or above"), value: 5),
                      DropdownMenuItem(child: Text("Below 5"), value: 4),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _ratingValue = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonHideUnderline(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff212121),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: Color(0xff212121),
                    style: TextStyle(color: Color(0x33ffffff)),
                    value: _genreValue,
                    hint: Text(
                      "Genre",
                      style: size16Medium.copyWith(color: Color(0x33ffffff)),
                    ),
                    items: [
                      DropdownMenuItem(child: Text("All"), value: 0),
                      DropdownMenuItem(
                          child: Text(genreArray[0]), value: genreArray[0]),
                      DropdownMenuItem(
                          child: Text(genreArray[1]), value: genreArray[1]),
                      DropdownMenuItem(
                          child: Text(genreArray[2]), value: genreArray[2]),
                      DropdownMenuItem(
                          child: Text(genreArray[3]), value: genreArray[3]),
                      DropdownMenuItem(
                          child: Text(genreArray[4]), value: genreArray[4]),
                      DropdownMenuItem(
                          child: Text(genreArray[5]), value: genreArray[5]),
                      DropdownMenuItem(
                          child: Text(genreArray[6]), value: genreArray[6]),
                      DropdownMenuItem(
                          child: Text(genreArray[7]), value: genreArray[7]),
                      DropdownMenuItem(
                          child: Text(genreArray[8]), value: genreArray[8]),
                      DropdownMenuItem(
                          child: Text(genreArray[9]), value: genreArray[9]),
                      DropdownMenuItem(
                          child: Text(genreArray[10]), value: genreArray[10]),
                      DropdownMenuItem(
                          child: Text(genreArray[11]), value: genreArray[11]),
                      DropdownMenuItem(
                          child: Text(genreArray[12]), value: genreArray[12]),
                      DropdownMenuItem(
                          child: Text(genreArray[13]), value: genreArray[13]),
                      DropdownMenuItem(
                          child: Text(genreArray[14]), value: genreArray[14]),
                      DropdownMenuItem(
                          child: Text(genreArray[15]), value: genreArray[15]),
                      DropdownMenuItem(
                          child: Text(genreArray[16]), value: genreArray[16]),
                      DropdownMenuItem(
                          child: Text(genreArray[17]), value: genreArray[17]),
                      DropdownMenuItem(
                          child: Text(genreArray[18]), value: genreArray[18]),
                      DropdownMenuItem(
                          child: Text(genreArray[19]), value: genreArray[19]),
                      DropdownMenuItem(
                          child: Text(genreArray[20]), value: genreArray[20]),
                      DropdownMenuItem(
                          child: Text(genreArray[21]), value: genreArray[21]),
                      DropdownMenuItem(
                          child: Text(genreArray[22]), value: genreArray[22]),
                      DropdownMenuItem(
                          child: Text(genreArray[23]), value: genreArray[23]),
                      DropdownMenuItem(
                          child: Text(genreArray[24]), value: genreArray[24]),
                      DropdownMenuItem(
                          child: Text(genreArray[25]), value: genreArray[25]),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _genreValue = value;
                        print(_genreValue);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonHideUnderline(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff212121),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: Color(0xff212121),
                    style: TextStyle(color: Color(0x33ffffff)),
                    value: _qualityValue,
                    hint: Text(
                      "Quality",
                      style: size16Medium.copyWith(color: Color(0x33ffffff)),
                    ),
                    items: [
                      DropdownMenuItem(child: Text("All"), value: 0),
                      DropdownMenuItem(child: Text("720p"), value: "720p"),
                      DropdownMenuItem(child: Text("1080p"), value: "1080p"),
                      DropdownMenuItem(child: Text("2160p"), value: "2160p"),
                      DropdownMenuItem(child: Text("3D"), value: "3D"),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _qualityValue = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "ORDER BY",
                style: size12Medium.copyWith(
                  color: Colors.white54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              DropdownButtonHideUnderline(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff212121),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: Color(0xff212121),
                    style: TextStyle(color: Color(0x33ffffff)),
                    value: _orderValue,
                    hint: Text(
                      "Order By",
                      style: size16Medium.copyWith(color: Color(0x33ffffff)),
                    ),
                    items: [
                      DropdownMenuItem(child: Text("All"), value: 0),
                      DropdownMenuItem(child: Text("Oldest"), value: "oldest"),
                      DropdownMenuItem(
                          child: Text("Featured"), value: "featured"),
                      DropdownMenuItem(child: Text("Seeds"), value: "seeds"),
                      DropdownMenuItem(child: Text("Peers"), value: "peers"),
                      DropdownMenuItem(child: Text("Latest"), value: "Latest"),
                      DropdownMenuItem(child: Text("Rating"), value: "rating"),
                      DropdownMenuItem(child: Text("Likes"), value: "likes"),
                      DropdownMenuItem(
                          child: Text("Downloads"), value: "Downloads"),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _orderValue = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [Color(0xff536F46), Color(0xff5D9F37)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.transparent,
                  onPressed: () {
                    var link = createSearchLink();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchResults(link)));
                  },
                  child: Text(
                    "Search",
                    style: size16Medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
