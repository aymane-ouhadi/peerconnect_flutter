import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/GroupDetailsModel.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/widgets/about_group_sheet.dart';
import 'package:peerconnect_flutter/widgets/empty_state.dart';
import 'package:peerconnect_flutter/widgets/event_card.dart';
import 'package:peerconnect_flutter/widgets/group_status_button.dart';
import 'package:peerconnect_flutter/widgets/post_card.dart';
import 'package:peerconnect_flutter/widgets/section_header.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';
import 'package:peerconnect_flutter/widgets/whats_on_your_mind.dart';
import 'package:provider/provider.dart';

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
                      groupDetailsModel: groupDetailsModel,
                      requestState: groupDetailsModel.requestState,
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
  String? requestState;
  final bool isMember;
  final GroupDetailsModel groupDetailsModel;

  // final _tabs = [
  //   Tab(text: 'Tab1'),
  //   Tab(text: 'Tab2'),
  // ];

  PageInfo({super.key, required this.name, required this.members, required this.isMember, required this.requestState, required this.groupDetailsModel});

  @override
  Widget build(BuildContext context) {

    print("request state : $requestState");

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GroupStatusButton(
                requestState: requestState,
                groupId: groupDetailsModel.group.id,
                userId: Provider.of<AuthProvider>(context, listen: false).user.id,
              ),
              SizedBox(width: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.grey[800],
                  elevation: 3
                ),
                onPressed: (){
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(  
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return AboutGroupSheet(
                        group: groupDetailsModel.group,
                        members: groupDetailsModel.members,
                      );
                    },
                  );
                }, 
                child: Row(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 10,),
                    Text("About")
                  ],
                ),
              )
            ],
          ),
          groupDetailsModel.requestState == "ACCEPTED" 
          ?
            WhatsOnYourMind(
              userId: Provider.of<AuthProvider>(context, listen: false).user.id,
              groupId: groupDetailsModel.group.id,
            )
          :
            SizedBox(),
          groupDetailsModel.requestState != "ACCEPTED" 
          ?
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                child: EmptyState(
                  image: "assets/images/not_member.png",
                  title: "You're not a member",
                  description: "Send a join request if you want to explore the group",
                ),
              ),
            )
          :
            Column(
              children: [
                SectionHeader(
                  name: "Events",
                  action: {
                    "/events": groupDetailsModel.events
                  }
                ),
                SizedBox(height: 30,),
                groupDetailsModel.events.length <= 0
                ?
                  EmptyState(
                    image: "assets/images/emptystate_events.png",
                    title: "No events",
                    description: "This is your chance to chill",
                  ) 
                :
                  Column(
                    children: [
                      ...groupDetailsModel.events.map((event) => Column(
                        children: [
                          EventCard(event: event),
                          SizedBox(height: 40,)
                        ],
                      )).toList().take(2),
                    ],
                  ),
                SectionHeader(
                  name: "Posts",
                  action: {
                    "/posts": groupDetailsModel.posts
                  }
                ),
                SizedBox(height: 30,),
                groupDetailsModel.posts.length <= 0
                ?
                  EmptyState(
                    image: "assets/images/emptystate_news.png",
                    title: "No posts",
                    description: "You're all caught up",
                  ) 
                :
                  Column(
                    children: [
                      ...groupDetailsModel.posts.map((post) => Column(
                        children: [
                          PostCard(post: post),
                          SizedBox(height: 40,)
                        ],
                      )).toList().take(2),
                    ],
                  ),
              ],
            )
          // TabBar(tabs: _tabs)
        ],
      ),
    );
  }
}