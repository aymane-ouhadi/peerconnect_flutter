import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/screens/post.dart';
import 'package:peerconnect_flutter/screens/home.dart';
import 'package:peerconnect_flutter/screens/login.dart';
import 'package:peerconnect_flutter/screens/posts.dart';
import 'package:peerconnect_flutter/screens/profile.dart';
import 'package:peerconnect_flutter/screens/register.dart';
import 'package:peerconnect_flutter/screens/events.dart';
import 'package:peerconnect_flutter/screens/search.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> map = {
    "/login": (BuildContext context) => const Login(),
    "/register": (BuildContext context) => const Register(),
    "/home": (BuildContext context) => const Home(),
    "/events": (BuildContext context) => const Events(),
    "/posts": (BuildContext context) => const Posts(),
    "/postDetails": (BuildContext context) => const PostScreen(),
    "/search": (BuildContext context) => const Search(),
    "/profile": (BuildContext context) => const Profile(),
  }; 
}