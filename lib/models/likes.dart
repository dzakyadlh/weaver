class Likes {
  final String id;
  final String userId;
  final String postId;

  const Likes({
    required this.id,
    required this.userId,
    required this.postId,
  });

  factory Likes.fromJson(Map<String, dynamic> json) {
    return Likes(
        id: json['id'], userId: json['user_id'], postId: json['post_id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'post_id': postId,
    };
  }
}
