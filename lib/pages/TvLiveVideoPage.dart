import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flix/Models/TvLives.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';






class TvLiveVideoPage extends StatefulWidget {
  int index;

  TvLiveVideoPage(this.index);

  @override
  _TvLiveVideoPageState createState() => _TvLiveVideoPageState();

}

class _TvLiveVideoPageState extends State<TvLiveVideoPage> {

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      TvLive[widget.index].videoUrl,

    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }



  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new  SafeArea(
      child: Scaffold(

      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child:  FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(TvLive[widget.index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: <Widget>[
                  Text(TvLive[widget.index].relevance,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(TvLive[widget.index].year,
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(TvLive[widget.index].description,
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.check, color: Colors.white),
                      Text("My list",
                          style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.thumb_up, color: Colors.white),
                      Text("Rate it",
                          style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.share, color: Colors.white),
                      Text("Share",
                          style: TextStyle(color: Colors.white54)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton:   FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              Wakelock.disable();
              _controller.pause();
            } else {
              // If the video is paused, play it.
              Wakelock.enable();
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    ));
  }
}
