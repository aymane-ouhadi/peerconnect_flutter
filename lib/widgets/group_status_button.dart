import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/enumerations/RequestState.dart';

class GroupStatusButton extends StatelessWidget {

  final RequestState? requestState;

  const GroupStatusButton({super.key, required this.requestState});

  @override
  Widget build(BuildContext context) {
    switch (requestState) {

      case RequestState.ACCEPTED:
        return ElevatedButton(
          onPressed: (){

          },
          child: Row(
            children: [
              Icon(Icons.check_circle_outline_outlined),
              Text("Already a member")
            ],
          ),
        );

      case RequestState.PENDING:
        return ElevatedButton(
          onPressed: (){

          },
          child: Row(
            children: [
              Icon(Icons.check_circle_outline_outlined),
              Text("Pending")
            ],
          ),
        );

      case null:
        return ElevatedButton(
          onPressed: (){

          },
          child: Row(
            children: [
              Icon(Icons.add_circle_outline_outlined),
              Text("Join the group")
            ],
          ),
        );
      
    }
  }
}