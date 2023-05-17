import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/utils/helpers.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MemberCard extends StatelessWidget {

  final User user;

  const MemberCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}