import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'Catalog.dart';

class ComicSoonFullList extends StatefulWidget {
  int index;

  ComicSoonFullList(this.index);

  @override
  _ComicSoonFullListState createState() => _ComicSoonFullListState();
}

class _ComicSoonFullListState extends State<ComicSoonFullList> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;
  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
//        movies[widget.index].videoUrl,
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();
    // Use the controller to loop the video.
    _controller.setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        VideoPlayer(
          _controller,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 100,
                child: Image.network(movies[widget.index].logo),
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.notifications, color: Colors.white),
                      Text("Receber Aviso",
                          style: TextStyle(color: Colors.white, fontSize: 10))
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.share, color: Colors.white),
                      Text("Compartilhe",
                          style: TextStyle(color: Colors.white, fontSize: 10))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text("Estreia " + movies[widget.index].dateComicSoon,
              style: TextStyle(color: Colors.white54, fontSize: 15)),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(movies[widget.index].title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(movies[widget.index].description,
              style: TextStyle(color: Colors.white54, fontSize: 15)),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
