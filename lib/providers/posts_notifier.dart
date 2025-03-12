import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weaver/models/post.dart';

part 'posts_notifier.g.dart';

@riverpod
class PostsNotifier extends _$PostsNotifier {
  @override
  FutureOr<List<Post>> build() async {
    return await _fetchPosts();
  }

  Future<List<Post>> _fetchPosts() async {
    const AsyncValue.loading();
    final String jsonString = await rootBundle.loadString(
      'assets/dummies/posts_dummy.json',
    );

    try {
      final jsonList = jsonDecode(jsonString);
      final postsData =
          (jsonList as List).map((item) => Post.fromJson(item)).toList();
      Future.delayed(const Duration(seconds: 3));
      state = AsyncValue.data(postsData);
      return postsData;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }
}
