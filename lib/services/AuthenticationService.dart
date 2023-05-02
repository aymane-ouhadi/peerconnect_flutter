import 'dart:convert';

import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/services/UserService.dart';
import 'package:peerconnect_flutter/utils/constants.dart';

import 'package:http/http.dart' as http;

class AuthenticationService {

  static Future<User?> fetchUser(
    String email,
    String password,
  ) async {

    try{

      Map data = {
        "email": email,
        "password": password
      };


      final response = await http.post(
        Uri.parse("${Constants.api}/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data) 
      );

      // print("uri : ${Uri.parse("${Constants.api}/posts/details").replace(queryParameters: queryParams)}");

      if (response.statusCode == 200) {

        // final Map<String, dynamic> jsonResponse = json.decode(response.body);
        // final PostDetailsModel post = PostDetailsModel.fromJson(jsonResponse);

        // final String jsonResponse = json.decode(response.body);
        // print("auth message : ${jsonResponse}");

        User user = await UserService.fetchUserByEmail(email);

        return user;
        
        // return null;
        
      } else {
        throw Exception('Failed to load post');
      }

    }
    catch(e){
      print("This is the error : $e");
      return null;
    }
  }

}