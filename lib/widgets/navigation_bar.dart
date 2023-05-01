import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/utils/constants.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/navigation_item.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.8,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: MyColors.primaryColor,
                    width: 3
                  ),
                  color: Colors.grey[200]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...Constants.routes.entries.map((route){
                      return MyNavigationItem(route: route);
                    }).toList()
                  ],
                ),
                // color: Colors.grey[200],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
