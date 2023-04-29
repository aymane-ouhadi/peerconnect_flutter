import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/widgets/post_card.dart';
import 'package:peerconnect_flutter/widgets/section_header.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';

class Posts extends StatelessWidget {
  
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {

    // List<Event> recentPosts = Samples.fetchPosts(5);
    List<Post> recentPosts = ModalRoute.of(context)!.settings.arguments as List<Post>;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                TopBar(isRoot: false),
                SectionHeader(name: "Recent Posts"),
                ...recentPosts.map((post) => Column(
                  children: [
                    PostCard(post: post),
                    SizedBox(height: 40,)
                  ],
                )).toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}