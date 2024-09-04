import 'package:cross_video_scroller/models/video/video.dart';
import 'package:cross_video_scroller/views/video_player_widget.dart';
import 'package:flutter/material.dart';

class VideosScroller extends StatelessWidget {
  final List<Video> videos;
  const VideosScroller({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoPlayerWidget(
          video: videos[index],
          index: index,
          videosCount: videos.length,
        );
      },
    );
  }
}
