import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Comment.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/avatar_placeholder.dart';

class CommentForm extends StatelessWidget {

  final Function submitComment;
  final User user;
  final Post post;
  final List<Comment> comments;

  String? comment = "";
  TextEditingController textEditingController = TextEditingController();


  CommentForm({
    Key? key,
    required this.user,
    required this.submitComment, 
    required this.post, 
    required this.comments,
    this.comment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            height: 30,
            child: AvatarPlaceholder(user: user,)
          ),
          SizedBox(width: 10,),
          //---------------------------------- This needs some work
          Flexible(
            child: TextField(
              controller: textEditingController,
              onChanged: (value){
                comment = value;
              },
              decoration: InputDecoration(
                hintText: "What do you Think ${user.firstName}?",
                border: InputBorder.none
                // hintText: "What do you Think ?"
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              submitComment(
                comments,
                comment,
                user,
                post
              );
              textEditingController.clear();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Text("Submit", style: TextStyle(fontWeight: FontWeight.bold, color: MyColors.primaryColor)),
          )
        ],
      ),
    );
  }
}