import 'dart:convert';
import 'package:cross_video_scroller/models/post/post.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  try {
    final String response = await rootBundle.loadString('assets/posts.json');
    final data = await json.decode(response) as List<dynamic>;
    final posts = data.map((e) => Post.fromJson(e)).toList();
    return posts;
  } catch (e) {
    print(e);
    return [];
  }
});
