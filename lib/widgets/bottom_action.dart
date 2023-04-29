import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class BottomAction extends StatelessWidget {

  final String question;
  final Map<String, Widget> action;

  const BottomAction({
    Key? key,
    required this.question,
    required this.action,
  }): super(key: key);

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
                question, 
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black
                )
              ),
              SizedBox(width: 5,),
              RichText(
                text: TextSpan(
                  text: action.keys.first,
                  style: TextStyle(
                    fontSize: 14,
                    color: MyColors.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print(action.values.first);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => action.values.first)
                      );
                      // Navigator.pushNamed(context, action.values.first);
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