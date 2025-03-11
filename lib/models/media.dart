class Media {
  final String id;
  final String url;
  final String type;

  const Media({
    required this.id,
    required this.url,
    required this.type,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      url: json['url'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'type': type,
    };
  }
}
