import 'package:peerconnect_flutter/models/Comment.dart';
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/models/Group.dart';
import 'package:peerconnect_flutter/models/Like.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/models/PostDetailsModel.dart';
import 'package:peerconnect_flutter/models/User.dart';

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

  static PostDetailsModel fetchPost(){
    return PostDetailsModel(
      user: User(
        id: "abc",
        firstName: "Aymane",
        lastName: "Ouhadi",
        email: "aymaneouhadi17@gmail.com",
        isConfirmed: true,
        college: "Le Mans University",
        major: "Software Engineering",
        password: "ada"
      ),
      group: Group(
        id: "abc",
        groupPicture: "",
        createdAt: "24th April 1967",
        name: "The Picnic Group of ENSIM",
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        rules: []
      ),
      post: Samples.fetchPosts(1).first,
      comments: List.generate(
        3, 
        (index) => Comment(
          id: "abc",
          userId: "abc",
          postId: "abc",
          comment: "Good stuff, man! I'm really liking the direction this group is headed in",
          publishedAt: "1 hour ago"
        )
      ),
      likes: List.generate(
        2, 
        (index) => Like(
          id: "abc",
          userId: "abc$index",
          postId: "abc"
        )
      )
    );
  }

  static List<User> fetchAttendees(int length){
    //I should implement a route event/attendees?postId=abc
    User user = User(
      id: "abc",
      firstName: "Aymane",
      lastName: "Ouhadi",
      email: "aymaneouhadi17@gmail.com",
      isConfirmed: true,
      college: "Le Mans University",
      major: "Software Engineering",
      password: "ada"
    );

    return List.generate(
      length, 
      (index) => User(
        id: "abc",
        firstName: "Aymane",
        lastName: "Ouhadi",
        email: "aymaneouhadi17@gmail.com",
        isConfirmed: true,
        college: "Le Mans University",
        major: "Software Engineering",
        password: "ada"
      )
    );
  }

  static User fetchAuthenticatedUser(){
    return User(
      id: "xaefaifpriapaigjarpg",
      firstName: "Aymane",
      lastName: "Ouhadi",
      email: "aymaneouhadi17@gmail.com",
      isConfirmed: true,
      college: "Le Mans University",
      major: "Software Engineering",
      password: "ada"
    );
  }

}