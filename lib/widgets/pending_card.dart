import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/utils/helpers.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/avatar_placeholder.dart';

class PendingCard extends StatelessWidget {

  final User user;

  final Function() onAccept;

  final Function() onRefuse;

  const PendingCard({super.key, required this.user, required this.onAccept, required this.onRefuse});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000)
              ),
              child: user.profilePicture != ""
              ?
                Image.network(user.profilePicture as String, fit: BoxFit.cover,)
              :
                AvatarPlaceholder(user: user)
              ,
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "${user.firstName} ${user.lastName}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    user.college,
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: onAccept,
              child: Icon(Icons.check_circle_outline_outlined, color: Colors.green,),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: onRefuse,
              child: Icon(Icons.cancel_outlined, color: MyColors.primaryColor),
            )
          ],
        )
      ],
    );
  }
}