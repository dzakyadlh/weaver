import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weaver/models/comment.dart';

part 'comments_notifier.g.dart';

@riverpod
class CommentsNotifier extends _$CommentsNotifier {
  @override
  FutureOr<List<Comment>> build() {
    return [];
  }

  Future<List<Comment>> fetchUserComments(String userId) async {
    state = const AsyncValue.loading();
    final String jsonString = await rootBundle.loadString(
      'assets/dummies/comments_dummy.json',
    );
    try {
      final jsonList = jsonDecode(jsonString);
      final commentsData =
          (jsonList as List).map((item) => Comment.fromJson(item)).toList();
      state = AsyncValue.data(commentsData);
      return commentsData;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }
}
