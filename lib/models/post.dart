import 'package:weaver/models/comment.dart';
import 'package:weaver/models/media.dart';
import 'package:weaver/models/weavee.dart';

class Post {
  final String id;
  final String caption;
  final DateTime updatedAt;
  final int likes;
  final List<Media> media;
  final List<Comment> comments;
  final Weavee user;

  const Post({
    required this.id,
    required this.caption,
    required this.updatedAt,
    required this.likes,
    required this.media,
    required this.comments,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String? ?? '',
      caption: json['caption'] as String? ?? '',
      likes: json['likes'] as int? ?? 0,
      updatedAt:
          DateTime.tryParse(json['updated_at'] as String? ?? '') ??
          DateTime.now(),
      media:
          (json['media'] as List<dynamic>?)
              ?.map((item) => Media.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      comments:
          (json['comments'] as List<dynamic>?)
              ?.map((item) => Comment.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      user: Weavee.fromJson(json['user'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'caption': caption,
      'updated_at': updatedAt,
      'likes': likes,
      'media': media.map((media) => media.toJson()).toList(),
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'user_id': user.id,
    };
  }
}
