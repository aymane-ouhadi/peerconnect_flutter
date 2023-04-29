class Post {
  final String id;
  final String publishedAt;
  final String userId;
  final String groupId;
  final String title;
  final String picture;
  final String description;

  Post({
    required this.id,
    required this.publishedAt,
    required this.userId,
    required this.groupId,
    required this.title,
    required this.picture,
    required this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      publishedAt: json['_publishedAt'],
      userId: json['userId'],
      groupId: json['groupId'],
      title: json['title'],
      picture: json['picture'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'publishedAt': publishedAt,
      'userId': userId,
      'groupId': groupId,
      'title': title,
      'picture': picture,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Post(id: $id, publishedAt: $publishedAt, userId: $userId, groupId: $groupId, title: $title, picture: $picture, description: $description)';
  }
}
