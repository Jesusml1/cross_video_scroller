import 'package:cross_video_scroller/models/post/post.dart';
import 'package:cross_video_scroller/views/videos_scroller.dart';
import 'package:flutter/material.dart';

class PostsScroller extends StatelessWidget {
  final List<Post> posts;

  const PostsScroller({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];

        return Stack(
          children: [
            VideosScroller(
              videos: posts[index].videos,
            ),
            Positioned(
              top: 60,
              left: 20,
              child: Text(
                post.username,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
