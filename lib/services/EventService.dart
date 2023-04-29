import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/utils/constants.dart';

class EventService {

  static Future<List<Event>> fetchRecentEvents(
    String userId
  ) async {

    final queryParams = {
      'userId': userId
    };

    final response = await http.get(
      Uri.parse("${Constants.api}/recent").replace(queryParameters: queryParams)
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      final List<Event> events = jsonResponse.map((event) => Event.fromJson(event)).toList();
      
      return events;
    } else {
      throw Exception('Failed to load album');
    }
  }

}