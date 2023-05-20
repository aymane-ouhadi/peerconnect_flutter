import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/UserProfileModel.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/services/UserService.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/utils/routes.dart';
import 'package:provider/provider.dart';

//My own type made to return ready-to-use icons  
typedef IconBuilder = Function;

class Constants {


  static String api = "https://peerconnect-backend.onrender.com";

  static String uploadedCoversBase = "assets/uploads/covers";

  static String uploadedEventsBase = "assets/uploads/events";

  static String uploadedPostsBase = "assets/uploads/posts";

  static String uploadedProfilesBase = "assets/uploads/profiles";
  
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
      "onTap": (BuildContext context){

        String authenticatedUserId = Provider.of<AuthProvider>(context, listen: false).user.id;

        print("hi : $authenticatedUserId");
        
        // UserService.fetchProfile(
        //   authenticatedUserId
        // ).then((value){
        //     Navigator.pushNamed(
        //       context, 
        //       "/profile", 
        //       arguments: value 
        //     );
        // }); 
      }
    },
    {
      "icon": const Icon(Icons.logout, color: MyColors.primaryColor),
      "title": "Log out of your account",
      "color": MyColors.primaryColor,
      "onTap": (BuildContext context){
        Navigator.pushReplacementNamed(context, "/login");
      }
    },
  ];
}