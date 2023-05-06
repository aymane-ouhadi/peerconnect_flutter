import 'package:peerconnect_flutter/models/group.dart';

class GroupSearchModel {
  final Group group;
  final bool isMember;

  GroupSearchModel({
    required this.group,
    required this.isMember,
  });

  factory GroupSearchModel.fromJson(Map<String, dynamic> json) {
    return GroupSearchModel(
      group: Group.fromJson(json['group']),
      isMember: json['member'],
    );
  }

  Map<String, dynamic> toJson() => {
        'group': group.toJson(),
        'isMember': isMember,
      };
}
