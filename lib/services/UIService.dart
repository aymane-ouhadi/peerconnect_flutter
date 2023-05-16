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

}