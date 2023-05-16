class CreatePostModel {
  // String publishedAt;
  String userId;
  String groupId;
  String title;
  String picture;
  String description;

  CreatePostModel({
    // required this.publishedAt,
    required this.userId,
    required this.groupId,
    required this.title,
    required this.picture,
    required this.description,
  });

  factory CreatePostModel.empty() {
    return CreatePostModel(
      // publishedAt: DateTime.now().toIso8601String(),
      userId: '',
      groupId: '',
      title: '',
      picture: '',
      description: '',
    );
  }

  @override
  String toString() {
    return 'CreatePostModel{'
        'userId: $userId, '
        'groupId: $groupId, '
        'title: $title, '
        'picture: $picture, '
        'description: $description'
        '}';
  }

  Map<String, dynamic> toJson() {
  return {
    // '_publishedAt': publishedAt,
    'userId': userId,
    'groupId': groupId,
    'title': title,
    'picture': picture,
    'description': description,
  };
}
}
