import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoOnay extends StatefulWidget {
  const VideoOnay({Key key, this.path}) : super(key: key);
  final String path;
  @override
  State<VideoOnay> createState() => _VideoOnayState();
}

class _VideoOnayState extends State<VideoOnay> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

/*Videoplayer video player paketinden geliyor.Kamera ve çekim için gerekenker camera paketinden geliyor. */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              Icons.crop_rotate,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.emoji_emotions_outlined,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 150,
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container()),
            Positioned(
              bottom: 0,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 55,
                    child: Card(
                        margin: EdgeInsets.only(bottom: 8, left: 3, right: 3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Başlık ekleyin..",
                            contentPadding: EdgeInsets.all(5),
                            prefixIcon: IconButton(
                              icon: Icon(
                                Icons.collections,
                                color: Colors.grey[800],
                                size: 25,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, right: 2),
                    child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFF128C7E),
                        child: IconButton(
                          icon: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )),
                  )
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
