class Attendee {
  final String id;
  final String userId;
  final String eventId;

  Attendee({
    required this.id,
    required this.userId,
    required this.eventId,
  });

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      id: json['id'],
      userId: json['userId'],
      eventId: json['eventId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'eventId': eventId,
      };
}
