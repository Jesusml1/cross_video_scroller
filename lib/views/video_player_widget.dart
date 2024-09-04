import 'package:cross_video_scroller/models/video/video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final Video video;
  final int index;
  final int videosCount;

  const VideoPlayerWidget({
    super.key,
    required this.video,
    required this.index,
    required this.videosCount,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.video.url));
    videoPlayerController.initialize().then((_) {
      videoPlayerController.setLooping(true);
      videoPlayerController.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: VideoPlayer(videoPlayerController),
        ),
        Positioned(
          top: 60,
          right: 20,
          child: Text(
            "${widget.index + 1}/${widget.videosCount}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
