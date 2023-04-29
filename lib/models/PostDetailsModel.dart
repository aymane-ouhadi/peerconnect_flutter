import 'package:peerconnect_flutter/models/Comment.dart';
import 'package:peerconnect_flutter/models/Group.dart';
import 'package:peerconnect_flutter/models/Like.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/models/User.dart';

class PostDetailsModel {

  final Post post;
  final Group group;
  final User user;
  final List<Comment> comments;
  final List<Like> likes;

  PostDetailsModel({
    required this.post,
    required this.group,
    required this.user,
    required this.comments,
    required this.likes,
  });

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> commentsJson = json['comments'] ?? [];
    List<Comment> comments = commentsJson.map((commentJson) => Comment.fromJson(commentJson)).toList();

    List<dynamic> likesJson = json['likes'] ?? [];
    List<Like> likes = likesJson.map((likeJson) => Like.fromJson(likeJson)).toList();

    return PostDetailsModel(
      post: Post.fromJson(json['post']),
      group: Group.fromJson(json['group']),
      user: User.fromJson(json['user']),
      comments: comments,
      likes: likes,
    );
  }

  static PostDetailsModel empty() {
    return PostDetailsModel(
      post: Post.empty(),
      group: Group.empty(),
      user: User.empty(),
      comments: [],
      likes: [],
    );
  }

}