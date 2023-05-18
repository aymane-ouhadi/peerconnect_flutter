class CreateEventModel {
  String userId;
  String groupId;
  String title;
  String picture;
  String description;
  String eventDate;

  CreateEventModel({
    required this.userId,
    required this.groupId,
    required this.title,
    required this.picture,
    required this.description,
    required this.eventDate,
  });

  factory CreateEventModel.empty() {
    return CreateEventModel(
      userId: '',
      groupId: '',
      title: '',
      picture: '',
      description: '',
      eventDate: '',
    );
  }
  
  @override
  String toString() {
    return 'CreateEventModel{'
        'userId: $userId, '
        'groupId: $groupId, '
        'title: $title, '
        'picture: ||$picture, ||'
        'description: $description, '
        'eventDate: $eventDate'
        '}';
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'groupId': groupId,
        'title': title,
        'picture': "",
        'description': description,
        'eventDate': eventDate,
      };
}
