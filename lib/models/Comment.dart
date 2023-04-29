class Comment {
  final String? id;
  final String publishedAt;
  final String userId;
  final String postId;
  final String comment;

  Comment({
    this.id,
    required this.publishedAt,
    required this.userId,
    required this.postId,
    required this.comment,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      publishedAt: json['_publishedAt'],
      userId: json['userId'],
      postId: json['postId'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'publishedAt': publishedAt,
        'userId': userId,
        'postId': postId,
        'comment': comment,
      };

  @override
  String toString() {
    return 'Comment{id: $id, publishedAt: $publishedAt, userId: $userId, postId: $postId, comment: $comment}';
  }
  
}
