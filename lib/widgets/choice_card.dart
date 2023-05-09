import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/widgets/empty_state.dart';

class ChoiceCard extends StatelessWidget {

  final String image;
  final String title;
  final String description;
  final Function() onPressed;

  const ChoiceCard({super.key, required this.image, required this.title, required this.description, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyState(
            image: image, 
            title: title,
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.center,
            child: Text(description, style: TextStyle(color: Colors.grey),),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: onPressed,
            child: Text("Let's Go", style: TextStyle(color: Colors.white),),
          )
        ]
      ),
    );
  }
}