import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isRoot ? 
            Container(
              width: 40,
              child: Image.asset("assets/images/icon.png"),
            ) 
          : 
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                color: MyColors.primaryColor,
                size: 30,
              ),
            ),

          GestureDetector(
            onTap: (){
              print("avatar press");
            },
            child: Container(
              width: 50,
              height: 60,
              child: Image.asset("assets/images/avatar.png")
            ),
          )
        ],
      ),
    );
  }
}