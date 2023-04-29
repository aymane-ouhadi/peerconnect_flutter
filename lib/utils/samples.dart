import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/models/Post.dart';

class Samples {

  static List<Event> fetchEvents(int length){

    return List.generate(
      length, 
      (index) => Event(
        id: "abc",
        publishedAt: "24th April 2023",
        userId: "abc",
        groupId: "abc",
        title: "Movie Night",
        picture: "eventPicture",
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        eventDate: "24th April 2023"
      )
    );
  }

  static List<Post> fetchPosts(int length){
    return List.generate(
      length, 
      (index) => Post(
        id: "abc",
        publishedAt: "1 hour ago",
        userId: "abc",
        groupId: "abc",
        title: "Group Rules Update",
        picture: "eventPicture",
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      )
    );
  }

}