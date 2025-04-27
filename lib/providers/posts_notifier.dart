import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weaver/models/post.dart';
import 'package:weaver/utils/supabase.dart';

part 'posts_notifier.g.dart';

@riverpod
class PostsNotifier extends _$PostsNotifier {
  @override
  FutureOr<List<Post>> build() async {
    return await _fetchPosts();
  }

  Future<List<Post>> _fetchPosts() async {
    state = const AsyncValue.loading();
    final response = await supabaseClient
        .from('posts')
        .select('''
          *,
          user_id (id, name, username, image_url),
          comments (
            id,
            content,
            created_at,
            user_id (id, name, username, image_url)
          ),
          media (
            id,
            url,
            type
          )
        ''')
        .order('updated_at', ascending: false);
    print(response);

    try {
      final postsData = response.map((item) => Post.fromJson(item)).toList();
      print(postsData);
      state = AsyncValue.data(postsData);
      return postsData;
    } catch (e, stackTrace) {
      print(e);
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }
}
