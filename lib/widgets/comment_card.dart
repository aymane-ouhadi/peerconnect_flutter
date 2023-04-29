import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/models/Comment.dart';

class CommentCard extends StatelessWidget {

  final Comment comment;

  const CommentCard({
    Key? key,
    required this.comment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                child: const Placeholder(),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment.userId, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(comment.publishedAt, style: TextStyle(color: Colors.grey),),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(comment.comment),
          )
        ],
      )
    );
  }
}