import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/models/GroupSearchModel.dart';
import 'package:peerconnect_flutter/utils/helpers.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class SearchGroupCard extends StatelessWidget {

  final GroupSearchModel group;
  
  const SearchGroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("group");
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: Placeholder(),
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text(
                          Helpers.substring(group.group.name, 25),
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          Helpers.substring(group.group.description, 30),
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: MyColors.primaryColor,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}