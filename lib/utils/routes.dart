import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/screens/choice.dart';
import 'package:peerconnect_flutter/screens/create_event.dart';
import 'package:peerconnect_flutter/screens/create_group.dart';
import 'package:peerconnect_flutter/screens/create_post.dart';
import 'package:peerconnect_flutter/screens/edit_profile.dart';
import 'package:peerconnect_flutter/screens/group.dart';
import 'package:peerconnect_flutter/screens/groups.dart';
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
    "/groupDetails": (BuildContext context) => const GroupScreen(),
    "/groups": (BuildContext context) => const Groups(),
    "/choice": (BuildContext context) => const ChoiceScreen(),
    "/create_post": (BuildContext context) => const CreatePostScreen(),
    "/create_event": (BuildContext context) => const CreateEventScreen(),
    "/create_group": (BuildContext context) => const CreateGroupScreen(),
    "/edit_profile": (BuildContext context) => const EditProfile(),
  }; 
}