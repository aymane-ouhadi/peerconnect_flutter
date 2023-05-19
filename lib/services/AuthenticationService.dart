import 'dart:convert';

import 'dart:io';
import 'package:peerconnect_flutter/models/RegisterModel.dart';
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

  static Future<http.Response> register(
    RegisterModel registerModel
  ) async {
    try {
      final response = await http.post(
        Uri.parse("${Constants.api}/auth/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(registerModel) 
      );
      

      return response;
    } catch (e) {
      print("error : $e");
      return http.Response(
        e.toString(), 
        500
      );
    }
  } 

  static Future<bool> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }

}