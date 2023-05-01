import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/widgets/navigation_bar.dart';

class UIService {

  static buildAppBar(){
    return MyNavigationBar();
  }

  static String substring(
    String original,
    int n
  ){
    if (original.length <= n) {
      return original;
    } else {
      return "${original.substring(0, n)}...";
    }
  }

}