import 'dart:convert';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/RegisterModel.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/services/UserService.dart';
import 'package:peerconnect_flutter/utils/constants.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constants.jwtDisplayName);
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

  static String generateJwt(
    String subject,
  ){

    final key = Constants.jwtKey;

    final claimSet = JwtClaim(
      issuer: Constants.jwtIssuer,
      subject: subject,
      issuedAt: DateTime.now(),
      maxAge: const Duration(hours: 12)
    );

    String token = issueJwtHS256(claimSet, key);

    print(token);

    return token;
  }

  static void storeJwt(
    String displayName,
    String jwt 
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(displayName, jwt);
  }

  static bool isJwtValid(JwtClaim jwt){
    
    //jwt expired
    if(jwt.expiry!.isBefore(DateTime.now())){
      return false;
    }
    
    //jwt still valid
    return true;
  }

  static void processJwt(BuildContext context) async {

    //Reading the jwt from the local storage
    String jwtString = await ComfortService.readFromLocalStorage(Constants.jwtDisplayName);

    //In case of non valid jwt
    if(jwtString == ""){
      return;
    }

    //Extracting userId from the jwt 
    final JwtClaim jwtClaim = verifyJwtHS256Signature(jwtString, Constants.jwtKey);

    //In case of non valid jwt
    if(!AuthenticationService.isJwtValid(jwtClaim)){
      return;
    }
    
    //Extracting userId from jwt
    String? userId = jwtClaim.subject;

    //Fetching the user (todo)
    UserService.fetchUser(userId as String)
    .then((value) {
      //Attaching user to provider
      AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.user = value;
      
      //Redirecting to home page
      Navigator.pushReplacementNamed(context, "/home");
    });


    print("extract id :${userId}");
  }


}