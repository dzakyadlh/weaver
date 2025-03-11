import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weaver/components/post_card.dart';
import 'package:weaver/providers/posts_notifier.dart';
import 'package:weaver/theme.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postsNotifierProvider);

    return postState.when(data: (posts) {
      return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostCard(post: posts[index]);
          });
    }, error: (e, stackTrace) {
      return Center(
        child: Text(
          e.toString(),
          style: errorTextStyle,
        ),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    });
  }
}
