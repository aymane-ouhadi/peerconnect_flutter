import 'dart:math';

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

  static Future<void> showGroupDialog(
    BuildContext context,
    String title,
    List<Widget> text,
    List<Widget> actions, 
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: text,
            ),
          ),
          actions: actions,
        );
      },
    );
  }

  static MaterialColor getRandomDarkColor() {
    final random = Random();
    final red = random.nextInt(128) + 128;
    final green = random.nextInt(128) + 128;
    final blue = random.nextInt(128) + 128;

    return MaterialColor(
      Color.fromRGBO(red, green, blue, 1).value,
      <int, Color>{
        50: Color.fromRGBO(red, green, blue, 0.1),
        100: Color.fromRGBO(red, green, blue, 0.2),
        200: Color.fromRGBO(red, green, blue, 0.3),
        300: Color.fromRGBO(red, green, blue, 0.4),
        400: Color.fromRGBO(red, green, blue, 0.5),
        500: Color.fromRGBO(red, green, blue, 0.6),
        600: Color.fromRGBO(red, green, blue, 0.7),
        700: Color.fromRGBO(red, green, blue, 0.8),
        800: Color.fromRGBO(red, green, blue, 0.9),
        900: Color.fromRGBO(red, green, blue, 1),
      },
    );
  }



}