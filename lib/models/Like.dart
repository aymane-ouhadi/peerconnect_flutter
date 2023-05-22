class Like {
  String? id;
  final String userId;
  final String postId;

  Like({
    this.id,
    required this.userId,
    required this.postId,
  });

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      id: json['id'],
      userId: json['userId'],
      postId: json['postId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'postId': postId,
      };
}
