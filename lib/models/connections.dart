class Connections {
  final String id;
  final String startUserId;
  final String endUserId;

  const Connections({
    required this.id,
    required this.startUserId,
    required this.endUserId,
  });

  factory Connections.fromJson(Map<String, dynamic> json) {
    return Connections(
      id: json['id'],
      startUserId: json['start_user_id'],
      endUserId: json['end_user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start_user_id': startUserId,
      'end_user_id': endUserId,
    };
  }
}
