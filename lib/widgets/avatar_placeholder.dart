import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/services/UIService.dart';

class AvatarPlaceholder extends StatelessWidget {

  final User user;

  const AvatarPlaceholder({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
      return user.profilePicture == ""
      ?
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: UIService.getRandomDarkColor()
          ),
          child: Center(
            child: Text(user.firstName == "" ? "" : user.firstName[0], style: TextStyle(fontSize: 25, color: Colors.white)),
          )
        )
      :
        Container(
          width: 50,
          height: 50,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Image.network(user.profilePicture as String, fit: BoxFit.cover,)
        );
  }
}