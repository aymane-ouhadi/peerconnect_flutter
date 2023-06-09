import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/utils/helpers.dart';

class PostCard extends StatelessWidget {

  final Post post;

  const PostCard({
    Key? key,
    required this.post  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/postDetails", arguments: post.id);
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(0),
                width: double.infinity,
                height: post.picture != "" ? 150 : 0,
                child: 
                post.picture != "" 
                ? 
                  Image.network(
                    post.picture, 
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                :
                  null
                // child: Container(child: Placeholder(), height: 150,),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostTop(title: post.title, date: ComfortService.toTimeAgo(post.publishedAt)),
                    PostCenter(description: post.description),
                    // PostBottom()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Helper widgets

class PostTop extends StatelessWidget {


  final String title;
  final String date;

  const PostTop({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Helpers.substring(title, 15),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            children: [
              Icon(Icons.schedule_outlined, size: 16, color: Colors.grey,),
              SizedBox(width: 5),
              Text(
                date,
                style: const TextStyle(
                  color: Colors.grey
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PostCenter extends StatelessWidget {

  final String description;

  const PostCenter({
    Key? key,
    required this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        style: TextStyle(
          color: Colors.grey[800]
        ),
        Helpers.substring(description, 130)
      ),
    );
  }
}

class PostBottom extends StatelessWidget {
  const PostBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
    
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline),
              SizedBox(width: 10),
              Text("Going")
            ],
          ),
        ),
      ),
    );
  }
}