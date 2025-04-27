import 'package:weaver/models/post.dart';

class Comment {
  final String id;
  final String postId;
  final String userId;
  final String content;
  final String commenterName;
  final String commenterUsername;
  final String commenterImageUrl;
  final Post post;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    required this.commenterName,
    required this.commenterUsername,
    required this.commenterImageUrl,
    required this.post,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] as String? ?? '',
      postId: json['post_id'] as String? ?? '',
      userId: json['user_id']?['id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      commenterName: json['user_id']?['name'] as String? ?? '',
      commenterUsername: json['user_id']?['username'] as String? ?? '',
      commenterImageUrl: json['user_id']?['imageUrl'] as String? ?? '',
      post: Post.fromJson(json['post'] as Map<String, dynamic>? ?? {}),
      createdAt:
          DateTime.tryParse(json['created_at'] as String? ?? '') ??
          DateTime.now(),
      updatedAt:
          DateTime.tryParse(json['updated_at'] as String? ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'post_id': postId,
      'user_id': userId,
      'content': content,
      'commenterName': commenterName,
      'commenterUsername': commenterUsername,
      'commenterImageUrl': commenterImageUrl,
      'post': post.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
