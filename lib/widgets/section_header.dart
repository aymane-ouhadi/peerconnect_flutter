import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class SectionHeader extends StatelessWidget {

  final String name;
  final Map<String, dynamic>? action; 

  const SectionHeader({
    Key? key,
    required this.name,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          action != null 
          ?
            GestureDetector(
              onTap: (){
                // print("See more : ${}");
                Navigator.pushNamed(
                  context, 
                  action!.keys.first,
                  arguments: action!.values.first
                );
              },
              child: Text(
                "See More",
                style: TextStyle(
                  color: MyColors.primaryColor
                )
              ),
            )
          :
            Container()
        ],
      ),
    );
  }
}