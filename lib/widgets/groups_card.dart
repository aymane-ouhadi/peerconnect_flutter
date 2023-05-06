import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/models/group.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class GroupsCard extends StatelessWidget {

  final List<Group> groups;

  const GroupsCard({super.key, required this.groups});
 
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Groups", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(
                        context, 
                        "/groups",
                        arguments: groups
                      );
                    },
                    child: Text("See More", style: TextStyle(color: MyColors.primaryColor),),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Wrap(
                children: groups.take(6).map((group){
                  return Column(
                    children: [
                      Container(
                        width: 85,
                        height: 85,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000)
                        ),
                        child: Image.asset(
                          "assets/images/barbecue.png", 
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(UIService.substring(group.name, 10), style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}