import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peerconnect_flutter/models/CreatePostModel.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/models/PostDetailsModel.dart';
import 'package:peerconnect_flutter/utils/constants.dart';

class PostService {

  static Future<List<Post>> fetchRecentPosts(
    String userId
  ) async {

    final queryParams = {
      'userId': userId
    };

    final response = await http.get(
      Uri.parse("${Constants.api}/posts/recent").replace(queryParameters: queryParams)
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      final List<Post> posts = jsonResponse.map((event) => Post.fromJson(event)).toList();

      // print("recent posts service : $posts");
      
      return posts;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<PostDetailsModel> fetchPostDetails(
    String postId
  ) async {

    final queryParams = {
      'postId': postId
    };

    final response = await http.get(
      Uri.parse("${Constants.api}/posts/details").replace(queryParameters: queryParams)
    );

    // print("uri : ${Uri.parse("${Constants.api}/posts/details").replace(queryParameters: queryParams)}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final PostDetailsModel post = PostDetailsModel.fromJson(jsonResponse);

      return post;
      
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<int> createPost(
    CreatePostModel post
  ) async {
    try{

      post.publishedAt = DateTime.now().toIso8601String();

      final response = await http.post(
        Uri.parse("${Constants.api}/posts/create"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(post) 
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