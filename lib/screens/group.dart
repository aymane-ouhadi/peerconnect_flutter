import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/enumerations/RequestState.dart';
import 'package:peerconnect_flutter/models/GroupDetailsModel.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/widgets/group_status_button.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';
import 'package:peerconnect_flutter/widgets/whats_on_your_mind.dart';

class GroupScreen extends StatefulWidget {

  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> with SingleTickerProviderStateMixin{

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

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
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    PageInfo(
                      name: groupDetailsModel.group.name,
                      members: groupDetailsModel.members,
                      isMember: groupDetailsModel.isMember,
                      requestState: groupDetailsModel.requestState as String,
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
  final String requestState;
  final bool isMember;

  // final _tabs = [
  //   Tab(text: 'Tab1'),
  //   Tab(text: 'Tab2'),
  // ];

  PageInfo({super.key, required this.name, required this.members, required this.isMember, required this.requestState});

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
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GroupStatusButton(
                requestState: requestState,
              )
            ],
          ),
          WhatsOnYourMind()
          // TabBar(tabs: _tabs)
        ],
      ),
    );
  }
}