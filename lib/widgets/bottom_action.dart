import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class BottomAction extends StatelessWidget {
  const BottomAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 70),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Not a remember?", 
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black
                )
              ),
              SizedBox(width: 5,),
              RichText(
                text: TextSpan(
                  text: 'Click this link',
                  style: TextStyle(
                    fontSize: 14,
                    color: MyColors.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/register');
                    },
                ),
              )
            ]
          ),
        ],
      ),
    );
  }
}