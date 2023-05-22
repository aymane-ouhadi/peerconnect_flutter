import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Group.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:peerconnect_flutter/models/UserProfileModel.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/widgets/groups_card.dart';
import 'package:peerconnect_flutter/widgets/info_card.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  UserProfileModel userProfileModel = UserProfileModel.empty();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      userProfileModel = ModalRoute.of(context)!.settings.arguments as UserProfileModel;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: UIService.buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TopBar(isRoot: true),
              ),
              Container(
                width: double.infinity, 
                height: 200, 
                child: 
                userProfileModel.user.coverPicture == null
                ?
                  Image.asset(
                    "assets/images/default_cover_1.jpg",
                    fit: BoxFit.cover,
                  )
                :
                  Image.network(
                    userProfileModel.user.coverPicture as String,
                    fit: BoxFit.cover,
                  )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "${userProfileModel.user.firstName} ${userProfileModel.user.lastName}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      )
                    ),
                    InfoCard(user: userProfileModel.user),
                    SizedBox(height: 40,),
                    GroupsCard(groups: userProfileModel.groups),
                    SizedBox(height: 50,)
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