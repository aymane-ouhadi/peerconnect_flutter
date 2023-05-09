import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class WhatsOnYourMind extends StatelessWidget {
  const WhatsOnYourMind({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "/choice");
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.language, color: Colors.grey[700], size: 25),
                Text("What's on your mind?", style: TextStyle(color: Colors.grey[700]),),
                Icon(Icons.chevron_right, color: MyColors.primaryColor, size: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}