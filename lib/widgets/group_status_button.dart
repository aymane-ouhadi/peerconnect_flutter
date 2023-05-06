import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/enumerations/RequestState.dart';

class GroupStatusButton extends StatelessWidget {

  final String? requestState;

  const GroupStatusButton({super.key, required this.requestState});

  @override
  Widget build(BuildContext context) {
    switch (requestState) {

      case "ACCEPTED":
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.green,
            elevation: 3
          ),
          onPressed: (){

          },
          child: Row(
            children: [
              Icon(Icons.check_circle_outline_outlined),
              SizedBox(width: 10),
              Text("Already a member")
            ],
          ),
        );

      case "PENDING":
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

      default:
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