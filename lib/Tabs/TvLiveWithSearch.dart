import 'package:flutter/material.dart';
import 'package:my_flix/Models/TvLives.dart';
import 'package:my_flix/pages/MoviePageScreem.dart';
import 'package:my_flix/pages/TvLiveVideoPage.dart';



class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Icon(Icons.search, color: Colors.white),
          title: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration.collapsed(
                hintText: "Search for series, films, genres, etc.",
                hintStyle: TextStyle(color: Colors.white70)),
          ),
          backgroundColor: Colors.white24,
          actions: <Widget>[
            Icon(
              Icons.keyboard_voice,
              color: Colors.white,
            )
          ],
        ),
        body: Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: TvLive.length + 1,
              itemBuilder: (context, index) {
                return index == 0
                    ? Padding(
                        padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
                        child: Text("Popular Searches",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)))
                    : Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 100,
                        color: Colors.white12,
                        child: Row(
                          children: <Widget>[
                            Container(
                                child: Stack(
                              children: <Widget>[
                                GestureDetector(
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(
                                        TvLive[index-1 ].imageUrl,
                                        width: 130,
                                        fit: BoxFit.cover,
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TvLiveVideoPage(index-1)));
                                  },
                                )
                              ],
                            )),
                            SizedBox(width: 15),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    TvLive[index - 1].title,

                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),

                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      );
              }),
        ));
  }
}
