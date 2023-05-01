import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/utils/routes.dart';

//My own type made to return ready-to-use icons  
typedef IconBuilder = Icon Function(bool isActive);

class Constants {


  static String api = "http://192.168.30.27:8080";
  
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
          Icons.person_3_outlined,
          color: isActive ? MyColors.primaryColor : Colors.black,
        );
      } 
    },
  };
}