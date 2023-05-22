import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/widgets/avatar_placeholder.dart';
import 'package:peerconnect_flutter/models/Comment.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/services/UserService.dart';

class CommentCard extends StatefulWidget {

  final Comment comment;

  const CommentCard({
    Key? key,
    required this.comment
  }) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {

  User user = User.empty();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    UserService.fetchUser(widget.comment.userId).then(
      (value) {
        setState(() {
          user = value;
          // postDetailsModel = Samples.fetchPost();
        });
      }
    );

  }

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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000)
                ),
                child: user.profilePicture == null
                ?
                  Image.network(
                    user.profilePicture as String,
                    fit: BoxFit.cover,
                  )
                :
                  AvatarPlaceholder(user: user)
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${user?.firstName} ${user?.lastName}", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(ComfortService.toTimeAgo(widget.comment.publishedAt), style: TextStyle(color: Colors.grey),),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(widget.comment.comment),
          )
        ],
      )
    );
  }
}