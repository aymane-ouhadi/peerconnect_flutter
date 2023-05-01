import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Comment.dart';
import 'package:peerconnect_flutter/models/Like.dart';
import 'package:peerconnect_flutter/models/PostDetailsModel.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/services/PostService.dart';
import 'package:peerconnect_flutter/utils/samples.dart';
import 'package:peerconnect_flutter/widgets/comment_card.dart';
import 'package:peerconnect_flutter/widgets/comment_form.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';

class PostScreen extends StatefulWidget {

  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostState();
}

class _PostState extends State<PostScreen> {

  PostDetailsModel? postDetailsModel = PostDetailsModel.empty();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final postId = ModalRoute.of(context)!.settings.arguments as String;

    PostService.fetchPostDetails(postId).then(
      (value){
        setState(() {
          postDetailsModel = value;
          // postDetailsModel = Samples.fetchPost();
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                TopBar(isRoot: false),
                AuthorBar(
                  group: postDetailsModel?.group.name as String,
                  firstName: postDetailsModel!.user.firstName,
                  lastName: postDetailsModel!.user.lastName,
                ),
                PostContent(
                  likes: postDetailsModel!.likes,
                  post: postDetailsModel!.post,
                  comments: postDetailsModel!.comments,
                ),
                PostBottom(
                  user: postDetailsModel!.user, 
                  comments: postDetailsModel!.comments,
                  post: postDetailsModel!.post,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthorBar extends StatelessWidget {

  final String group;
  final String firstName;
  final String lastName;

  const AuthorBar({
    Key? key,
    required this.group,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          child: Placeholder(),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              group,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "$firstName $lastName",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

          ],
        )
      ],
    );
  }
}

class PostContent extends StatefulWidget {

  final List<Comment> comments;
  final List<Like> likes;
  final Post post;

  const PostContent({
    Key? key,
    required this.likes, 
    required this.post,
    required this.comments
  }) : super(key: key);

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.post.description)
            ]),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: Container(
              width: double.infinity,
              height: 200,
              child: Placeholder(),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // if(widget.likes.where((like) => false)){

                        // }
                        // else{
                          
                        // }
                      });
                    },
                    child: Icon(Icons.favorite_outline, size: 25,),
                  ),
                  SizedBox(height: 5),
                  Text("${widget.likes.length}")
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: Icon(Icons.chat_bubble_outline_outlined, size: 23,),
                  ),
                  SizedBox(height: 5),
                  Text("${widget.comments.length}")
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PostBottom extends StatefulWidget {

  final User user;

  final List<Comment> comments;

  final Post post;

  const PostBottom({
    Key? key,
    required this.comments, 
    required this.user, 
    required this.post
  }) : super(key: key);

  @override
  State<PostBottom> createState() => _PostBottomState();
}

class _PostBottomState extends State<PostBottom> {

  void _submitComment(
    List<Comment> comments,
    String description, 
    User user, 
    Post post
  ){

    Comment comment = Comment(
      publishedAt: DateTime.now().toIso8601String(), 
      userId: user.id, 
      postId: post.id, 
      comment: description
    );

    setState((){
      comments.add(comment);
    });

    // print(comment);
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ...widget.comments.map((comment) => CommentCard(comment: comment)).toList(),
          CommentForm(
            user: widget.user, 
            post: widget.post, 
            comments: widget.comments,
            submitComment: _submitComment
          )
        ],
      ),
    );
  }
}
