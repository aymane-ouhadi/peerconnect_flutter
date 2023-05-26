import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/group.dart';
import 'package:peerconnect_flutter/services/UIService.dart';

class GroupPlaceholder extends StatelessWidget {

  final Group group;

  const GroupPlaceholder({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
      return group.groupPicture == ""
      ?
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: UIService.getRandomDarkColor()
          ),
          child: Center(
            child: Text(group.name == "" ? "" : group.name[0], style: TextStyle(fontSize: 25, color: Colors.white)),
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
          child: Image.network(group.groupPicture as String, fit: BoxFit.cover,)
        );
  }
}