import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peerconnect_flutter/models/Event.dart';
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

}