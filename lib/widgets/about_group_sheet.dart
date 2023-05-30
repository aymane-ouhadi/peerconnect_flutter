import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peerconnect_flutter/models/Group.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/services/GroupService.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/member_card.dart';
import 'package:peerconnect_flutter/widgets/pending_card.dart';

class AboutGroupSheet extends StatelessWidget {

  final Group group;

  final List rules;

  final List<User> members;

  final List<User> pending;

  final bool isAdmin;

  const AboutGroupSheet({super.key, required this.group, required this.members, required this.pending, required this.rules, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: MyColors.primaryColor, width: 6),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 8,
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 50,),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 25),
                child: Container(
                  child: Text(
                    "About",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                child: Container(
                  child: Text(
                    group.description,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 25),
                child: Container(
                  child: Text(
                    "Rules",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    ...rules.map((rule) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              "\u2022  ${rule}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          SizedBox(height: 25,),
                        ],
                      );                      
                    })
                  ],
                ),
              ),
              isAdmin
              ?
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 25),
                      child: Container(
                        child: Text(
                          "Pending",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          ...pending.map((member) {
                            return Column(
                              children: [
                                PendingCard(
                                  user: member,
                                  onAccept: (){
                                    Fluttertoast.showToast(
                                      msg: "${member.firstName} is a part of the group now",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: MyColors.toastColor,
                                      timeInSecForIosWeb: 1,
                                    );
                                    GroupService.accept(member.id, group.id);
                                  },
                                  onRefuse: (){
                                    Fluttertoast.showToast(
                                      msg: "${member.firstName} is no longer a part of this group",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: MyColors.toastColor,
                                      timeInSecForIosWeb: 1,
                                    );
                                    GroupService.ban(member.id, group.id);
                                  },  
                                ),
                                SizedBox(height: 25,),
                              ],
                            );                      
                          })
                        ],
                      ),
                    ),

                  ],
                )
              :
                Container(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 25),
                child: Container(
                  child: Text(
                    "Members",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    ...members.map((member) {
                      return Column(
                        children: [
                          MemberCard(
                            user: member,
                            onBan: (){
                              Fluttertoast.showToast(
                                msg: "${member.firstName} is no longer a part of this group",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: MyColors.toastColor,
                                timeInSecForIosWeb: 1,
                              );
                              GroupService.ban(member.id, group.id);
                            }
                          ),
                          SizedBox(height: 25,),
                        ],
                      );                      
                    })
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