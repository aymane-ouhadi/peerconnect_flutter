import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/EditProfileModel.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/models/UserProfileModel.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/services/UserService.dart';
import 'package:peerconnect_flutter/services/AuthenticationService.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/utils/routes.dart';
import 'package:provider/provider.dart';

//My own type made to return ready-to-use icons  
typedef IconBuilder = Function;

class Constants {


  static String api = "https://peerconnect-backend.onrender.com";

  static String uploadedCoversBase = "covers";

  static String uploadedEventsBase = "events";

  static String uploadedPostsBase = "posts";

  static String uploadedProfilesBase = "profiles";

  static String uploadedGroupsBase = "groups";

  static String jwtKey = "mySecretKey";

  static String jwtIssuer = "peerconnect";

  static String jwtDisplayName = "peerconnect_jwt";
  
  static Map<String, Map<String, IconBuilder>> routes = {
    "/home": {
      "Feed": (bool isActive) {
        return Icon(
          Icons.rss_feed_rounded,
          color: isActive ? MyColors.primaryColor : Colors.black,
        );
      } 
    },
    "/search": {
      "Search": (bool isActive) {
        return Icon(
          Icons.search_outlined,
          color: isActive ? MyColors.primaryColor : Colors.black,
        );
      } 
    },
    "/profile": {
      "Profile": (bool isActive) {
        return Icon(
          Icons.person_2_outlined,
          color: isActive ? MyColors.primaryColor : Colors.black,
        );
      },
      "onTap": (BuildContext context, String userId) async {
        UserProfileModel userProfileModel = await UserService.fetchProfile(userId); 
        Navigator.pushReplacementNamed(
          context, 
          "/profile",
          arguments: userProfileModel
        );
      }
    },
  };

  static List<Map<String, dynamic>> bottomSheetOptions = [
    {
      "icon": const Icon(Icons.person_outline, color: Colors.black),
      "title": "Visit your profile",
      "color": Colors.black,
      "onTap": (BuildContext context) async {

        String authenticatedUserId = Provider.of<AuthProvider>(context, listen: false).user.id;

        print("hi : $authenticatedUserId");
        
        UserProfileModel userProfileModel = await UserService.fetchProfile(authenticatedUserId); 
        Navigator.pushReplacementNamed(
          context, 
          "/profile",
          arguments: userProfileModel
        );
      }
    },
    {
      "icon": const Icon(Icons.settings_outlined, color: Colors.black),
      "title": "Edit your profile",
      "color": Colors.black,
      "onTap": (BuildContext context) async {

        String authenticatedUserId = Provider.of<AuthProvider>(context, listen: false).user.id;

        print("hi : $authenticatedUserId");
        
        User user = await UserService.fetchUser(authenticatedUserId); 
        Navigator.pushReplacementNamed(
          context, 
          "/edit_profile",
          arguments: EditProfileModel.adapt(user)
        );
      }
    },
    {
      "icon": const Icon(Icons.logout, color: MyColors.primaryColor),
      "title": "Log out of your account",
      "color": MyColors.primaryColor,
      "onTap": (BuildContext context){
        AuthenticationService.logout();
        Navigator.pushReplacementNamed(context, "/login");
      }
    },
  ];
}