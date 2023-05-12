import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peerconnect_flutter/models/CreateEventModel.dart';
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
      Uri.parse("${Constants.api}/events/recent").replace(queryParameters: queryParams)
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      final List<Event> events = jsonResponse.map((event) => Event.fromJson(event)).toList();

      // print("recent events service : $events");
      
      return events;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<int> createEvent(
    CreateEventModel eventModel
  ) async {
    try{

      eventModel.publishedAt = DateTime.now().toIso8601String();

      final response = await http.post(
        Uri.parse("${Constants.api}/posts/create"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(eventModel) 
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

}