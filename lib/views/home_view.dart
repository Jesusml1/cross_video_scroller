import 'package:cross_video_scroller/providers/posts_provider.dart';
import 'package:cross_video_scroller/views/posts_scroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);

    return Scaffold(
      body: posts.when(
        data: (data) {
          return PostsScroller(posts: data);
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text("Error fetching videos"),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
