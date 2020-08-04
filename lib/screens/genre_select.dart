import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yipy_yts/constants.dart';
import 'package:yipy_yts/utilities/bottom_navigation_bar.dart';

class GenreSelect extends StatefulWidget {
  static String id = "genre_select_id";

  @override
  _GenreSelectState createState() => _GenreSelectState();
}

class _GenreSelectState extends State<GenreSelect> {
  var anythingSelected = 0;
  var style = TextStyle(fontSize: 100, color: Colors.white24, fontWeight: FontWeight.bold, height: 1.2);
  List<bool> selected = List.generate(genreArray.length, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: AutoSizeText(
                  "Choose\nyour\nfavou\nrite",
                  minFontSize: 50,
                  maxLines: 4,
                  style: TextStyle(fontSize: 100, color: Colors.white24, fontWeight: FontWeight.bold, height: 1.2),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      useRootNavigator: true,
                      context: (context),
                      builder: (_) {
                        return Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          child: StatefulBuilder(
                            builder: (context, modalState) {
                              return ListView.builder(
                                  itemCount: genreArray.length,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      child: ListTile(
                                        title: AutoSizeText(genreArray[i],
                                            maxLines: 1, style: style.copyWith(color: selected[i] ? primaryColor : Colors.white24)),
                                        onTap: () {
                                          modalState(() {
                                            selected[i] = !selected[i];
                                          });
                                          setState(() {
                                            selected[i] ? anythingSelected-- : anythingSelected++;
                                            print(anythingSelected);
                                          });
                                        },
                                      ),
                                    );
                                  });
                            },
                          ),
                        );
                      });
                },
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: AutoSizeText(
                          "genre",
                          minFontSize: 50,
                          maxLines: 1,
                          style: TextStyle(fontSize: 100, color: Colors.white54, fontWeight: FontWeight.bold, height: 1.2),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          constraints: BoxConstraints(maxHeight: 100, maxWidth: 100, minHeight: 10, minWidth: 10),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white54,
                          ),
                          iconSize: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  color: anythingSelected != 0 ? primaryColor : Colors.white10,
                  icon: Icon(Icons.arrow_forward),
                  iconSize: 100,
                  onPressed: anythingSelected == 0
                      ? null
                      : () {
                          Navigator.pushNamed(context, NavigationBar.id);
                        },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
