import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peerconnect_flutter/models/CreateGroupModel.dart';
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

  static Future<int> createGroup(
    CreateGroupModel createGroupModel
  ) async {
    try{

      final response = await http.post(
        Uri.parse("${Constants.api}/groups/create"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(createGroupModel.toJson()) 
      );

      print("status: ${response.statusCode}");

      return response.statusCode;

      // print("uri : ${Uri.parse("${Constants.api}/posts/details").replace(queryParameters: queryParams)}");


    }
    catch(e){
      print("This is the error : $e");
      return 500;
    }
  }

  Future<int> ban(
    String userId,
    String groupId,
  ) async {

    final queryParams = {
      'userId': userId,
      'groupId': groupId,
    };

    try{
      final response = await http.put(
        Uri.parse("${Constants.api}/groups/ban").replace(queryParameters: queryParams),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return response.statusCode;
    }
    catch(e){
      print("This is the error : $e.");
      return 500;
    }
  }

  Future<int> join(
    String userId,
    String groupId,
  ) async {

    final queryParams = {
      'userId': userId,
      'groupId': groupId,
    };

    try{
      final response = await http.post(
        Uri.parse("${Constants.api}/groups/join").replace(queryParameters: queryParams),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return response.statusCode;
    }
    catch(e){
      print("This is the error : $e.");
      return 500;
    }

  }

}