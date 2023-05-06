import 'user.dart';
import 'group.dart';

class UserProfileModel {
  final User user;
  final List<Group> groups;

  UserProfileModel({
    required this.user,
    required this.groups,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      user: User.fromJson(json['user']),
      groups: (json['groups'] as List<dynamic>)
          .map((groupJson) => Group.fromJson(groupJson))
          .toList(),
    );
  }

  factory UserProfileModel.empty() {
    return UserProfileModel(
      user: User.empty(),
      groups: [],
    );
  }

  Map<String, dynamic> toJson() => {
    'user': user.toJson(),
    'groups': groups.map((group) => group.toJson()).toList(),
  };

  @override
  String toString() {
    return "profile: ${this.user}, ${this.groups}";
  }
}
