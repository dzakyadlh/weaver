import 'package:weaver/models/post.dart';

class Weavee {
  final String id;
  final String email;
  final String name;
  final String username;
  final String? imageUrl;
  final String? bio;
  final List<Post> posts;

  const Weavee({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    this.imageUrl,
    this.bio,
    required this.posts,
  });

  factory Weavee.fromJson(Map<String, dynamic> json) {
    return Weavee(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      username: json['username'],
      imageUrl: json['imageUrl'],
      bio: json['bio'],
      posts:
          (json['posts'] as List)
              .map((post) => Post.fromJson(post as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'username': username,
      'imageUrl': imageUrl,
      'bio': bio,
      'posts': posts.map((post) => post.toJson()).toList(),
    };
  }
}
