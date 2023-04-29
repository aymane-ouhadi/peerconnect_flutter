import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TopBar extends StatelessWidget {

  final bool isRoot;

  const TopBar({
    Key? key,
    required this.isRoot
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          isRoot ? 
            Text("Logo") 
          : 
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),

          Text("Avatar")
        ],
      ),
    );
  }
}