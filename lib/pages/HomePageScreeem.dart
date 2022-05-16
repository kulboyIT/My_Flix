import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Tabs/Movie.dart';
import '../Tabs/TvShows.dart';
import '../Tabs/HomeTab.dart';
import '../Tabs/MoreTab.dart';
import '../Tabs/TvLiveWithSearch.dart';


class HomePageScreem extends StatefulWidget {
  int userLoged = 1;

  HomePageScreem(this.userLoged);

  @override
  _HomePageScreemState createState() => _HomePageScreemState();
}

class _HomePageScreemState extends State<HomePageScreem> {
  int currentTabIndex = 0;
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.grey[900],
          accentColor: Colors.white,
          scaffoldBackgroundColor: Colors.grey[900],
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Image(
                image: NetworkImage(
                  'https://logodownload.org/wp-content/uploads/2018/07/prime-video-1.png',
                  scale: 40,
                ),
              ),
            ),

            bottom: new TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 20.0),

              tabs: <Widget>[
                Tab(text: 'Home'),
                Tab(text: 'Tv Online'),
                Tab(text: 'Movies'),
                Tab(text: 'Tv Shows'),
                Tab(text: 'Kids'),
              ],

            ),
          ),

          body: TabBarView(
            children: <Widget>[
              HomeTab(),
              TvLiveWithSearch(),
              Movie(),
              TvShows(),
              MoreTab(widget.userLoged),
            ],
          ), //ScreenSelector(page: 'HOME'),
          bottomNavigationBar: Theme(
            data: ThemeData(
              canvasColor: Colors.black,
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label:'Find',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_download),
                  label: 'Download',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'My Stuff',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
