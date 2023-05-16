import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/enumerations/RequestState.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class GroupStatusButton extends StatefulWidget {

  String? requestState;

  GroupStatusButton({super.key, this.requestState});

  @override
  State<GroupStatusButton> createState() => _GroupStatusButtonState();
}

class _GroupStatusButtonState extends State<GroupStatusButton> {
  @override
  Widget build(BuildContext context) {
    switch (widget.requestState) {

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
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.grey[800],
            elevation: 3
          ),
          onPressed: (){
            UIService.showGroupDialog(
              context,
              "Unsend Join Request",
              [
                Text("Are you sure you want to unsend your request?", style: TextStyle(color: Colors.grey),)
              ],
              [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    minimumSize: const Size(double.infinity, 0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: MyColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: Text("Let's do it")
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    minimumSize: const Size(double.infinity, 0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.white,
                    foregroundColor: MyColors.primaryColor,
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: Text("Cancel")
                ),
              ]
            );
          },
          child: Row(
            children: [
              Icon(Icons.hourglass_empty_outlined),
              SizedBox(width: 10,),
              Text("Pending")
            ],
          ),
        );

      default:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            elevation: 3
          ),
          onPressed: (){
            setState(() {
              widget.requestState = "PENDING";
            });
          },
          child: Row(
            children: [
              Icon(Icons.add_circle_outline_outlined),
              SizedBox(width: 10,),
              Text("Join the group")
            ],
          ),
        );
      
    }
  }
}