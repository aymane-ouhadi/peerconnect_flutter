class Event {
  String id;
  String publishedAt;
  String userId;
  String groupId;
  String title;
  String picture;
  String description;
  String eventDate;

  Event({
    required this.id,
    required this.publishedAt,
    required this.userId,
    required this.groupId,
    required this.title,
    required this.picture,
    required this.description,
    required this.eventDate,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json["id"],
      publishedAt: json["_publishedAt"],
      userId: json["userId"],
      groupId: json["groupId"],
      title: json["title"],
      picture: json["picture"],
      description: json["description"],
      eventDate: json["eventDate"],
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
      'eventDate': eventDate,
    };
  }


  @override
  String toString() {
    return 'Event{id: $id, publishedAt: $publishedAt, userId: $userId, groupId: $groupId, title: $title, picture: $picture, description: $description, eventDate: $eventDate}';
  }
}
