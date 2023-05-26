import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/models/GroupDetailsModel.dart';
import 'package:peerconnect_flutter/models/GroupSearchModel.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/services/GroupService.dart';
import 'package:peerconnect_flutter/utils/helpers.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/group_placeohlder.dart';
import 'package:provider/provider.dart';

class SearchGroupCard extends StatelessWidget {

  final GroupSearchModel group;
  
  const SearchGroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        AuthProvider provider = Provider.of<AuthProvider>(context, listen: false);

        GroupDetailsModel groupDetailsModel = await GroupService.fetchGroupDetails(
          provider.user.id, 
          group.group.id
        );

        Navigator.pushNamed(
          context, 
          "/groupDetails",
          arguments: groupDetailsModel
        );
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
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000)
                    ),
                    child: 
                    group.group.groupPicture != ""
                    ?
                      Image.network(
                        group.group.groupPicture,
                        fit: BoxFit.cover,
                      )
                    :
                      GroupPlaceholder(group: group.group),
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