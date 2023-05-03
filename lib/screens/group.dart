import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/enumerations/RequestState.dart';
import 'package:peerconnect_flutter/models/GroupDetailsModel.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/widgets/group_status_button.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';

class GroupScreen extends StatelessWidget {

  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    GroupDetailsModel groupDetailsModel = ModalRoute.of(context)!.settings.arguments as GroupDetailsModel;

    return Scaffold(
      bottomNavigationBar: UIService.buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TopBar(isRoot: false),
              ),
              Container(
                width: double.infinity,
                height: 200,
                child: Placeholder(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    PageInfo(
                      name: groupDetailsModel.group.name,
                      members: groupDetailsModel.members,
                      isMember: groupDetailsModel.isMember,
                      requestState: groupDetailsModel.requestState as RequestState,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageInfo extends StatelessWidget {

  final String name;
  final List<User> members;
  final RequestState requestState;
  final bool isMember;

  const PageInfo({super.key, required this.name, required this.members, required this.isMember, required this.requestState});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name, 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)
          ),
          SizedBox(height: 20,),
          members.length > 4
          ?
            Text(
              "${members[0].firstName}, ${members[1].firstName} and ${members.length - 2} other members",
              style: TextStyle(color: Colors.grey),
            )
          :
            Text(
              "${members.length} members",
              style: TextStyle(color: Colors.grey),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GroupStatusButton(
                requestState: requestState,
              )
            ],
          )
        ],
      ),
    );
  }
}