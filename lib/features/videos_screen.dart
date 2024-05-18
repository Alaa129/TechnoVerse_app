import 'package:alaa/core/shared_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

bool isFullScreen = false;

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final List<String> _videoIds = [
    'XGOOZFXErl4',
  ];

  late final List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();

    _controllers = _videoIds
        .map((videoId) => YoutubePlayerController(
              initialVideoId: videoId,
              flags: YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            ))
        .toList();

    _controllers[0].addListener(_onPlayerStateChange);
  }

  void _onPlayerStateChange() {
    setState(() {
      isFullScreen = _controllers[0].value.isFullScreen;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: isFullScreen
          ? null
          : PreferredSize(
              child: CustomAppBar(
                name: "Watching",
                image: 'assets/images/onBoarding_vedio.png',
              ),
              preferredSize: Size.fromHeight(height * 0.2),
            ),
      body: ListView.builder(
        itemCount: _videoIds.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                YoutubePlayerBuilder(
                  onExitFullScreen: () {
                    setState(() {
                      isFullScreen = false;
                    });
                  },
                  player: YoutubePlayer(
                    controller: _controllers[
                        index], // Use the correct controller for each video
                    showVideoProgressIndicator: true,
                  ),
                  builder: (context, player) =>
                      player, // No need for Visibility anymore
                ),
                if (index !=
                    _videoIds.length -
                        1) // Add divider except for the last video
                  SizedBox(height: height * 0.02),
              ],
            ),
          );
        },
      ),
    );
  }
}
