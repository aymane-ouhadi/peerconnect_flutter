import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Comment.dart';
import 'package:peerconnect_flutter/models/Like.dart';
import 'package:peerconnect_flutter/models/PostDetailsModel.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/services/PostService.dart';
import 'package:peerconnect_flutter/utils/samples.dart';
import 'package:peerconnect_flutter/widgets/comment_card.dart';
import 'package:peerconnect_flutter/widgets/avatar_placeholder.dart';
import 'package:peerconnect_flutter/widgets/comment_form.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {

  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostState();
}

class _PostState extends State<PostScreen> {

  PostDetailsModel? postDetailsModel = PostDetailsModel.empty();

  AuthProvider? provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final postId = ModalRoute.of(context)!.settings.arguments as String;

    provider = Provider.of<AuthProvider>(context, listen: false);

    PostService.fetchPostDetails(postId).then(
      (value){
        setState(() {
          postDetailsModel = value;
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
                  user: postDetailsModel!.user,
                ),
                PostContent(
                  likes: postDetailsModel!.likes,
                  post: postDetailsModel!.post,
                  comments: postDetailsModel!.comments,
                  user: postDetailsModel!.user,
                  doLike: (Like like){
                    setState(() {
                      postDetailsModel!.likes.add(like);
                    });
                  },
                ),
                PostBottom(
                  user: provider!.user, 
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
  final User user;

  const AuthorBar({
    Key? key,
    required this.group,
    required this.firstName,
    required this.lastName,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvatarPlaceholder(user: user),
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
  final User user;

  final Function(Like) doLike;

  const PostContent({
    Key? key,
    required this.likes, 
    required this.post,
    required this.comments, 
    required this.user, required this.doLike
  }) : super(key: key);

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {

  AuthProvider? provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    provider = Provider.of<AuthProvider>(context, listen: false);

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.post.description)
              ]),
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              width: double.infinity,
              height: 200,
              child: widget.post.picture == "" 
              ?
                Container()
              :
                Image.network(
                  widget.post.picture, 
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
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
                        widget.doLike(
                          Like(
                            postId: widget.post.id,
                            userId: widget.user.id
                          )
                        );
                      });
                    },
                    child: Icon(widget.likes.length <= 0 ? Icons.favorite_outline : Icons.favorite, size: 25,),
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
