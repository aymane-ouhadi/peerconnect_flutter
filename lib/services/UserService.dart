import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peerconnect_flutter/models/PostDetailsModel.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/models/UserProfileModel.dart';
import 'package:peerconnect_flutter/utils/constants.dart';

class UserService {

  static Future<User> fetchUser(
    String userId
  ) async {

    final queryParams = {
      'userId': userId
    };

    final response = await http.get(
      Uri.parse("${Constants.api}/users").replace(queryParameters: queryParams)
    );


    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final User user = User.fromJson(jsonResponse);
      
      print("uri : ${Uri.parse("${Constants.api}/users").replace(queryParameters: queryParams)}");

      return user;
      
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<User> fetchUserByEmail(
    String email
  ) async {
    final queryParams = {
      'email': email
    };

    final response = await http.get(
      Uri.parse("${Constants.api}/users/findByEmail").replace(queryParameters: queryParams)
    );

    print("what abt this : ${response.statusCode}");


    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final User user = User.fromJson(jsonResponse);
      
      print("uri : ${Uri.parse("${Constants.api}/users/findByEmail").replace(queryParameters: queryParams)}");

      return user;
      
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<UserProfileModel> fetchProfile(
    String userId
  ) async {

    final queryParams = {
      'userId': userId
    };

    final response = await http.get(
      Uri.parse("${Constants.api}/users/details").replace(queryParameters: queryParams)
    );


    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final UserProfileModel user = UserProfileModel.fromJson(jsonResponse);
      
      print("uri : ${Uri.parse("${Constants.api}/users").replace(queryParameters: queryParams)}");

      return user;
      
    } else {
      throw Exception('Failed to load post');
    }
  }

}