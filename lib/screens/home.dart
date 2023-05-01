import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/services/eventService.dart';
import 'package:peerconnect_flutter/widgets/empty_state.dart';
import 'package:peerconnect_flutter/widgets/event_card.dart';
import 'package:peerconnect_flutter/widgets/post_card.dart';
import 'package:peerconnect_flutter/widgets/section_header.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';
import 'package:peerconnect_flutter/utils/samples.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Event> recentEvents = List.empty();
  List<Post> recentPosts = List.empty();

  @override
  void initState() {
    super.initState();
    
    setState(() {
      EventService.fetchRecentEvents("643d8b0a64d5b15895af8a26").then(
        (value) {
          setState(() {
            recentEvents = value;
            print("result: $value");
          });
        }
      );
      // recentEvents = Samples.fetchEvents(3);
      recentPosts = Samples.fetchPosts(3);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: UIService.buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                TopBar(isRoot: true),
                SectionHeader(
                  name: "Events",
                  action: {
                    "/events": recentEvents
                  }
                ),
                recentEvents.length == 0 
                ? 
                  EmptyState(
                    image: "assets/images/emptystate_news.png",
                    title: "No events",
                    description: "You're all caught up",
                  )   
                :
                  EventCard(event: recentEvents[0])
                ,
                SectionHeader(
                  name: "Posts",
                  action: {
                    "/posts": recentPosts
                  }
                ),
                recentEvents.length == 0 
                ? 
                  EmptyState(
                    image: "assets/images/emptystate_news.png",
                    title: "No posts",
                    description: "You're all caught up",
                  )   
                :
                  PostCard(post: recentPosts[0])
                ,
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}