import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/GroupSearchModel.dart';
import 'package:peerconnect_flutter/models/group.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/search_group_card.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';

class Groups extends StatelessWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context) {

    List<Group> groups = ModalRoute.of(context)!.settings.arguments as List<Group>;
    
    return Scaffold(
      bottomNavigationBar: UIService.buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              TopBar(isRoot: false),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Groups", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  GestureDetector(
                    onTap: (){
                      print('create a group');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline, color: MyColors.primaryColor, size: 20,),
                        SizedBox(width: 7,),
                        Text("Create a Group", style: TextStyle(color: MyColors.primaryColor),),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    ...groups.map((group) {
                      return SearchGroupCard(
                        group: GroupSearchModel(
                          isMember: false,
                          group: group
                        ),
                      );
                    }).toList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}