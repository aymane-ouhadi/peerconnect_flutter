class CreateEventModel {
  String publishedAt;
  String userId;
  String groupId;
  String title;
  String picture;
  String description;
  String eventDate;

  CreateEventModel({
    required this.publishedAt,
    required this.userId,
    required this.groupId,
    required this.title,
    required this.picture,
    required this.description,
    required this.eventDate,
  });

  factory CreateEventModel.empty() {
    return CreateEventModel(
      publishedAt: DateTime.now().toIso8601String(),
      userId: '',
      groupId: '',
      title: '',
      picture: '',
      description: '',
      eventDate: DateTime.now().toIso8601String(),
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
}
