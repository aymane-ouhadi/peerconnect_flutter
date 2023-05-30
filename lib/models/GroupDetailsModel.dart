import 'package:peerconnect_flutter/enumerations/requestState.dart';
import 'package:peerconnect_flutter/models/Group.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/models/Post.dart';

class GroupDetailsModel {
  final Group group;
  final bool isMember;
  final String? requestState;
  final List<User> members;
  final List<User> pending;
  final List<Event> events;
  final List<Post> posts;
  final List<dynamic> rules;
  final bool isAdmin;

  GroupDetailsModel({
    required this.requestState,
    required this.group,
    required this.isMember,
    required this.members,
    required this.pending,
    required this.events,
    required this.posts,
    required this.rules,
    required this.isAdmin,
  });

  factory GroupDetailsModel.fromJson(Map<String, dynamic> json) {
    return GroupDetailsModel(
      group: Group.fromJson(json['group']),
      isMember: json['member'],
      requestState: json['requestState'],
      members: (json['members'] as List).map((e) => User.fromJson(e)).toList(),
      pending: (json['pending'] as List).map((e) => User.fromJson(e)).toList(),
      events: (json['events'] as List).map((e) => Event.fromJson(e)).toList(),
      posts: (json['posts'] as List).map((e) => Post.fromJson(e)).toList(),
      rules: json['rules'],
      isAdmin: json['admin'],
    );
  }

  Map<String, dynamic> toJson() => {
        'group': group.toJson(),
        'isMember': isMember,
        'requestState': requestState,
        'members': members.map((e) => e.toJson()).toList(),
        'events': events.map((e) => e.toJson()).toList(),
        'posts': posts.map((e) => e.toJson()).toList(),
      };

  factory GroupDetailsModel.empty() {
    return GroupDetailsModel(
      group: Group.empty(),
      isMember: false,
      requestState: null,
      members: [],
      pending: [],
      events: [],
      posts: [],
      rules: [],
      isAdmin: false,
    );
  }

  @override
  String toString() {
    return 'GroupDetailsModel{group: $group, isMember: $isMember, members: $members, events: $events, posts: $posts}';
  }
}
