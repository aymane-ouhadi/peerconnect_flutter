import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/models/GroupDetailsModel.dart';
import 'package:peerconnect_flutter/models/GroupSearchModel.dart';
import 'package:peerconnect_flutter/utils/constants.dart';

class GroupService {

  static Future<List<GroupSearchModel>> fetchGroups(
    String q,
    String userId,
  ) async {

    final queryParams = {
      'userId': userId,
      'q': q,
    };

    final response = await http.get(
      Uri.parse("${Constants.api}/groups/search").replace(queryParameters: queryParams)
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      final List<GroupSearchModel> groups = jsonResponse.map((group) => GroupSearchModel.fromJson(group)).toList();

      print("recent groups service : $groups");
      
      return groups;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<GroupDetailsModel> fetchGroupDetails(
    String userId,
    String groupId,
  ) async {

    // try{

    // }
    final queryParams = {
      'userId': userId,
      'groupId': groupId,
    };

    final response = await http.get(
      Uri.parse("${Constants.api}/groups/details").replace(queryParameters: queryParams)
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final GroupDetailsModel group = GroupDetailsModel.fromJson(jsonResponse);

      print("The group : $group");
      
      return group;


      // GroupDetailsModel group = GroupDetailsModel.empty();
      // print(group);
      // return group;

    } else {
      print("This is URI : ${Uri.parse("${Constants.api}/groups/details").replace(queryParameters: queryParams)}");
      // throw Exception('Failed to load album');
      return GroupDetailsModel.empty();
    }
  }

}