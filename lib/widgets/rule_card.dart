import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class RuleCard extends StatelessWidget {

  final String rule;
  final Function onCancelTap;

  const RuleCard({super.key, required this.rule, required this.onCancelTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(rule),
              GestureDetector(
                onTap: (){
                  onCancelTap(rule);
                },
                child: Icon(Icons.cancel_outlined, color: MyColors.primaryColor,),
              )
            ],
          ),
        ),
      ),
    );
  }
}